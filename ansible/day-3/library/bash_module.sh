#!/usr/bin/bash

source $1

#echo '{"changed": true, "msg": "Updated stuff"}'
cd /home/student/cm/ansible/day-3
#echo $1 >YYYYYYY
msg="${msg}file converted to lower case"
contents=$(printf "$new" | python -c 'import json,sys; print json.dumps(sys.stdin.read())')
/usr/bin/vagrant status | grep default
#aaa = `/usr/bin/vagrant status`
#echo $1 >>YYYYYYY

exit 0