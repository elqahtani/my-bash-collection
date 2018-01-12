#!/bin/bash

# Database credentials
user="" 	#fill with your username 
password="" # fill with your database
host="" 	#fill with your host
db_name="" 	#fill with your database name 

# Other options
backup_path="/opt/backup/database" // make sure this folder is available for your backup location 
date=$(date +"%d-%b-%Y")

# Set default file permissions
umask 177

# Dump database into SQL file
mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql
gzip $backup_path/$db_name-$date.sql
/opt/source/dropbox -q upload $backup_path/$db_name-$date.sql.gz Database

# Delete files older than 7 days
find $backup_path/* -mtime +7 -exec rm {} \;
