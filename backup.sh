#!/bin/bash

echo "is_multi=$is_multi" >> $GITHUB_OUTPUT
echo "mongodb_uri=$mongodb_uri" >> $GITHUB_OUTPUT

BACKUP_DIR="backups"
  if [ ! -d ./$BACKUP_DIR/ ]; then
    mkdir $BACKUP_DIR
  else
    rm -rf $BACKUP_DIR
    mkdir $BACKUP_DIR
  fi

if [ "$is_multi" = true ]; then
  IFS=","
  array=($mongodb_uri)
  for element in "${array[@]}"
  do
    echo "uri:: $element"
    mongodump --uri "$element" -o=./$BACKUP_DIR
  done
else
  echo "uri= $mongodb_uri"
  mongodump --uri $mongodb_uri -o=./$BACKUP_DIR
fi

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/