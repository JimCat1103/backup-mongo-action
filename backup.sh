#!/bin/bash

echo "IS_MULTI=$is_multi" >> $GITHUB_OUTPUT
echo "INPUT_MONGODB_URI=$mongodb_uri" >> $GITHUB_OUTPUT

BACKUP_DIR="backups"
  if [ ! -d ./$BACKUP_DIR/ ]; then
    mkdir $BACKUP_DIR
  else
    rm -rf $BACKUP_DIR
    mkdir $BACKUP_DIR
  fi

if [ "$is_multi" = "true" ]; then
  IFS=',' read -r -a array <<< "$mongodb_uri"
  for i in "${array[@]}"
  do
     sudo mongodump --uri $i -o=./$BACKUP_DIR
  done
else
  sudo mongodump --uri $INPUT_MONGODB_URI -o=./$BACKUP_DIR
fi

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/