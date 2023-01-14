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

IFS=',' read -r -a array <<< $INPUT_MONGODB_URI
for i in "${array[@]}"
do
  echo "this in $i"
#     mongodump --uri $i -o=./$BACKUP_DIR
done

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/