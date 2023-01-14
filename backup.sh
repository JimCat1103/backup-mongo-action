#!/bin/bash

BACKUP_DIR="backups"
if [ ! -d ./$BACKUP_DIR/ ]; then
  mkdir $BACKUP_DIR
else
  rm -rf $BACKUP_DIR
  mkdir $BACKUP_DIR
fi

echo "INPUT_MONGODB_URI=$mongodb_uri" >> $GITHUB_OUTPUT
array=()
IFS=',' read -r -a array <<< $INPUT_MONGODB_URI
echo $INPUT_MONGODB_URI
if [[ "${#array[@]}" -eq 0 ]]; then
  echo "i want in "
  echo $INPUT_MONGODB_URI
else
   for i in "${array[@]}" ; do
     echo "this in $i"
   done
fi

echo "Show me backups:"
ls -lFhS ./$BACKUP_DIR/