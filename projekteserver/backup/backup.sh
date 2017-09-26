#!/bin/bash
set -e

SERVICE=jira.service
DATE=$(date +"%Y_%m_%d-%H-%M-%S")
TMP_DEST="/tmp/backups/$DATE"
DESTINATION=/opt/backups
DESTFILENAME="jira-backup-$DATE.tar.gz"
DESTFILE="$DESTINATION/$DESTFILENAME"

JIRADATA=/var/atlassian/application-data/jira/data
DBNAME=jiradb
SQLUSER=postgres

S3BUCKET=plazaroute-backup

mkdir -p ${DESTINATION}
mkdir -p ${TMP_DEST}

echo "Stopping service $SERVICE"
systemctl stop $SERVICE

# Backup db
sudo -u $SQLUSER pg_dump $DBNAME > $TMP_DEST/$DBNAME-$DATE.sql

# backup data
rsync -av $JIRADATA $TMP_DEST

# tar and move to backups
tar cvzf $DESTFILE -C $TMP_DEST .

# upload to S3
aws s3api put-object --bucket $S3BUCKET --key $DESTFILENAME --body $DESTFILE


echo "Starting service $SERVICE"
systemctl start $SERVICE
