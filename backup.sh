#!/bin/sh -l

echo "INPUT_MONGODB_URI=$db_uri" >> $GITHUB_OUTPUT
echo "INPUT_MONGODB_NAME=$db_name" >> $GITHUB_OUTPUT

BACKUP_DIR="backups"
  if [ ! -d ./$BACKUP_DIR/ ]; then
    mkdir $BACKUP_DIR
  fi

echo $INPUT_MONGODB_URI
echo $INPUT_MONGODB_NAME

mongodump --uri $INPUT_MONGODB_URI --db $INPUT_MONGODB_NAME -o=./$BACKUP_DIR

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/

tar zcvf $INPUT_MONGODB_NAME.tar.gz $BACKUP_DIR

ls -lFhS ./$BACKUP_DIR/