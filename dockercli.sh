#!/bin/bash

source /root/DockerCLI/functions/main.sh


echo " "
tput setaf 2
echo -e  "\t\t\t\t\t # 🐳    Hello Sir Welcome to Docker Automate Program 🐳    #"
echo " "
tput setaf 3

read -p "Enter your Input YES/NO to setup Docker Services : " input


if [[ $input == yes || $input == YES ]]
then
		 
	yum install docker -y &> /dev/null
	systemctl start docker
	systemctl enable docker 
	tput setaf 2
	echo -e  "\t\t\t\t Docker setup Done Services started succesfully"
	tput setaf 7
	main
	
else
	echo " "
	tput setaf 6
	echo -e  "\t\t\t\t #  Thanks See You  !! #"
	echo " "
	tput setaf 7
fi
