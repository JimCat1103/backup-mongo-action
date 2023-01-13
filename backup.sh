#!/bin/bash

BACKUP_DIR="backups"
if [ ! -d ./$BACKUP_DIR/ ]; then
  mkdir $BACKUP_DIR
else
  rm -rf $BACKUP_DIR
  mkdir $BACKUP_DIR
fi

echo "exec_type=$exec_type" >> $GITHUB_OUTPUT
echo "INPUT_MONGODB_URI=$mongodb_uri" >> $GITHUB_OUTPUT

TYPE=$exec_type
if [ "$TYPE" == "multi" ]; then
  IFS=","
  array=($string)
  for element in "${array[@]}"
  do
    echo "uri:: $element"
    mongodump --uri "$element" -o=./$BACKUP_DIR
  done
else
  echo "uri= $exec_type, $INPUT_MONGODB_URI"
  mongodump --uri $INPUT_MONGODB_URI -o=./$BACKUP_DIR
fi

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/