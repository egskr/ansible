 #!/bin/bash
 
source $1
echo 'Build time:' $(date) > $path/src/main/resources/build-info.txt
echo 'Build Machine name:' $(hostname) >> $path/src/main/resources/build-info.txt
echo 'Build User name:' $(whoami) >> $path/src/main/resources/build-info.txt

cd $path
mvn clean package -D$buildNumber &>/dev/null

cd $path/target
sshpass -p "vagrant"  scp $path/target/$war $user@$url

printf '{"failed": false, "changed": true}'