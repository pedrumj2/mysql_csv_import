#!/bin/bash

if [ $1 == "-h" ]; then
  printf "Usage <Password> <database> <csv file>\n"
  printf "note escape special characters in password\n"
else
  NAME=$(basename $3);
  echo $NAME;
 A=$(printf "mysql -u root -p'%s' %s -e \"CREATE TABLE IF NOT EXISTS %s(" $1 $2 $NAME)
  B=$(head -1 $3 | sed -e 's/,/ VARCHAR(20),/g')
  
  C=$(printf  " VARCHAR(20));\"\n")
 eval $A $B $C
 #echo $C;
# eval $B;
  #$D=$(printf "%s" $B)
 # echo $D;
 # echo $3;
  
  
  A=$(printf "mysqlimport --local --ignore-lines=1 --fields-terminated-by=, -u root -p'%s'\n\n %s " $1 $2)
 B=$(printf "%s\n" $3)
 
 eval $A $B
   echo $A
   echo $B
fi