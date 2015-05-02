#!/bin/bash
echo -e "Enter group's name? "
read userinput
echo "dn: cn=${userinput},ou=Groups,dc=example,dc=com
changetype: modify
add: memberUid" >> add-user-to-${userinput}.ldif;
while read line;
do
name=$line;
echo "memberUid: $line" >> add-user-to-${userinput}.ldif;
done < ./data
