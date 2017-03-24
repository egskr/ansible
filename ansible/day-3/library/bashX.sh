#!/usr/bin/bash


    function starting_vagrant
    { 
        contents=$(cd /home/student/cm/ansible/day-3; /usr/bin/vagrant up 2>&1 | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))')   
    }

     function status_vagrant
    { 
        contents=$(/usr/bin/vagrant status | grep running &>/dev/null; if [[ $? == 0 ]]; then echo "Vagrant started"; else echo "Vagrant stopped"; fi  | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))')
    }

     function stop_vagrant
    { 
        contents=$(cd /home/student/cm/ansible/day-3; /usr/bin/vagrant halt 2>&1 | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))')  
    }

source $1


changed="false"
msg=""
contents=""

case $state in   
    status)
        status_vagrant
        ;;
    start)
        starting_vagrant
        ;;
    stop)
        stop_vagrant
        ;;
    *)
        printf '{"failed": true, "msg": "invalid state: %s"}' "$state"
        exit 1
        ;;
esac

#printf '{"changed": %s, "msg": "%s", "contents": %s}' "$changed" "$msg" "$contents"
printf '{"changed": %s, "msg": "%s", "contents": %s}' "$changed" "$msg" "$contents"
#echo $msg

exit 0