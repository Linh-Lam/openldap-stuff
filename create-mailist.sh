#!/bin/bash
echo "Enter group's name:"
read userinput
echo "dn: mail=${userinput},ou=Groups,ou=GoogleAppsGroups,dc=atlassian,dc=com
changetype: add
objectClass: distributionList
objectClass: top
mail:${userinput}
cn:${userinput}">> Creating-${userinput}.ldif;
while read line;
do
name=$email;
echo "listMember: ${line}" >> Creating-${userinput}.ldif;
done < ./maillist
