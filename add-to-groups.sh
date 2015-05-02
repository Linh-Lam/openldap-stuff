#!/bin/bash
echo "Enter user name?"
read userinput
while read line;
do
name=$line
echo dn: cn=$line,ou=Groups,dc=example,dc=com>> add-${userinput}-to-groups.ldif;
echo changetype: modify>> add-${userinput}-to-groups.ldif;
echo add: memberUid>> add-${userinput}-to-groups.ldif;
echo memberUid: ${userinput}>> add-${userinput}-to-groups.ldif;
echo >> add-${userinput}-to-groups.ldif;
done < ./data
