#!/bin/bash

if [ $1 == "-h" ]; then
  printf "Usage <Password> <database> <csv file>\n"
  printf "note escape special characters in password\n"
else

  I=0
  (cd $3; ls -l) |	awk '{print $9}' |
	while read x; do 
		I=$((I+1));
		if [ $I != 1 ]; then
			eval "./script.sh" $1 $2 $3"/"$x
		fi
	done
  
fi