#!/bin/sh -l

echo "IS_MULTI=$is_multi" >> $GITHUB_OUTPUT
echo "INPUT_MONGODB_URI=$mongodb_uri" >> $GITHUB_OUTPUT

BACKUP_DIR="backups"
  if [ ! -d ./$BACKUP_DIR/ ]; then
    mkdir $BACKUP_DIR
  fi

uri_str="mongodbUri1, mongodbUri2, mongodbUri3"
IFS=',' read -r -a array <<< "$uri_str"

for i in "${array[@]}"
do
   sudo mongodump --uri $INPUT_MONGODB_URI -o=./$BACKUP_DIR
done

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/