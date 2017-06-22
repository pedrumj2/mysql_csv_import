#!/bin/bash

if [ $1 == "-h" ]; then
  printf "Usage <Password> <database> <csv file>\n"
  printf "note escape special characters in password\n"
else
  NAME=$(echo $3 | cut -f 1 -d '.')
  rest=$(head -1 $3 | sed -e 's/,/ VARCHAR(20),/g')
  mysql -u root -p$1 $2 -e "CREATE TABLE IF NOT EXISTS ${NAME} ( ${rest}  VARCHAR(20))"  
  mysqlimport --local --ignore-lines=1 --fields-terminated-by=, -u root -p$1 $2 $3
fi
