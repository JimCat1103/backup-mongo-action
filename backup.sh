#!/bin/sh -l

echo "INPUT_MONGODB_URI=$db_uri" >> $GITHUB_OUTPUT

BACKUP_DIR="backups"
  if [ ! -d ./$BACKUP_DIR/ ]; then
    mkdir $BACKUP_DIR
  fi

echo $INPUT_MONGODB_URI

mongodump --uri $INPUT_MONGODB_URI -o=./$BACKUP_DIR

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/