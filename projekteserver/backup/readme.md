# Backup Projekteserver
## Setup
- Auf Amazon AWS einen S3 Bucket erstellen
- Pip installieren
```bash
apt-get install python-pip
```
- AWS CLI installieren: `pip install awscli`
- Config-file als `~/.aws/credentials` erstellen
```
[default]
aws_access_key_id=foo
aws_secret_access_key=bar
```
- Buckets anzeigen: `aws s3api list-buckets`

- Backup script nach `/opt/backups` kopieren

## Systemd services
- `jira-backup.service` und `jira-backup.timer` nach `/lib/systemd/system/` kopieren
- Aktivieren:
```bash
systemctl enable jira-backup.timer
systemctl start jira-backup.timer
```
