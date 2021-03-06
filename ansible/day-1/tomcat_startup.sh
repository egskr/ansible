#!/bin/bash

command=$1

if [[ $command == "start" ]]; then
	echo "Please wait. Tomcat is starting...."
	/opt/tomcat/apache-tomcat-XXXXX/bin/startup.sh
	echo "Tomcat started succesfully"
elif [[ $command == "stop" ]]; then	
	/opt/tomcat/apache-tomcat-XXXXX/bin/shutdown.sh
	echo "Tomcat is stopping"
elif [[ $command == "status" ]]; then
	num_of_proc=$(ps aux | grep tomcat | grep /opt/tomcat/apache-tomcat| grep -v grep | wc -l)
	if [[ num_of_proc -gt 0 ]]; then
		echo "Tomcat is running"
	else
		echo "Tomcat stopped"
	fi	
else
	echo "Usage: $0 {start | stop | status}"
fi
