#!/bin/bash

BACKUP_DIR="backups"
if [ ! -d ./$BACKUP_DIR/ ]; then
  mkdir $BACKUP_DIR
else
  rm -rf $BACKUP_DIR
  mkdir $BACKUP_DIR
fi

echo "EXEC_TYPE=$exec_type" >> $GITHUB_OUTPUT
echo "INPUT_MONGODB_URI=$mongodb_uri" >> $GITHUB_OUTPUT

if [ -n $EXEC_TYPE ]; then
  IFS=","
  array=($string)
  for element in "${array[@]}"
  do
    echo "uri:: $element"
    mongodump --uri "$element" -o=./$BACKUP_DIR
  done
fi

echo "??? $exec_type"
echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/