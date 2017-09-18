# JIRA Installation
Manual: <https://confluence.atlassian.com/adminjiraserver074/connecting-jira-applications-to-postgresql-881683178.html>

## Postgres
```bash
apt-get install postgresql postgresql-client
```
### User Management
```bash
sudo -u postgres psql
```
```sql
ALTER ROLE postgres WITH ENCRYPTED PASSWORD '***';
CREATE ROLE jiradbuser WITH LOGIN;
ALTER ROLE jiradbuser WITH ENCRYPTED PASSWORD '***';
```

### Setup Database
```sql
CREATE DATABASE jiradb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
```
```sql
GRANT ALL PRIVILEGES ON DATABASE jiradb TO jiradbuser;
```
## Jira Installation
```bash 
chmod +x atlassian-jira-software-7.5.0-x64.bin
./atlassian-jira-software-7.5.0-x64.bin
```
- Installation directory: `/opt/atlassian/jira`
- Software data directory: `/var/atlassian/application-data/jira`
- Ports: `8888` (HTTP), `8005` (RMI)
- Run as service: yes

## Nginx reverse proxy
### Docker install
- Docker CE Nach Anleitung <https://docs.docker.com/engine/installation/linux/docker-ce/debian/>
- Docker compose nach Anleitung installieren: <https://docs.docker.com/compose/install/#install-compose>

### Nginx
- Die Konfiguration ist angelehnt an <https://github.com/Excape/searx-docker>
- Config liegt unter `/opt/nginx-jira`

### Systemd Services
```bash
cp /opt/nginx-jira/systemd/* /lib/systemd/system/
systemctl enable nginx-jira.service
systemctl enable dehydrated.timer
systemctl start dehydrated.timer
systemctl start nginx-jira
```

## JIRA Config
- Config-File `/opt/atlassian/jira/conf/server.xml`
- Adresse des Reverse Proxys hinzufügen

```xml
<Connector port="8888"
   maxThreads="150"
   minSpareThreads="25"
   connectionTimeout="20000"

   enableLookups="false"
   maxHttpHeaderSize="8192"
   protocol="HTTP/1.1"
   useBodyEncodingForURI="true"
   redirectPort="8443"
   acceptCount="100"
   disableUploadTimeout="true"
   bindOnInit="false"

   scheme="https"
   proxyName="jira.robinsuter.ch"
   proxyPort="443"
/>
```
