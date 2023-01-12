#!/bin/bash
BACKUP_DIR="backups"
  if [ ! -d ./$BACKUP_DIR/ ]; then
    mkdir $BACKUP_DIR
  fi

mongodump --uri $INPUT_MONGODB_URI -o=./$BACKUP_DIR

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/