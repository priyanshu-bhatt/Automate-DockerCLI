#!/bin/bash

main(){

source /root/DockerCLI/functions/run.sh
source /root/DockerCLI/functions/delete.sh
source /root/DockerCLI/functions/build.sh
source /root/DockerCLI/functions/volume.sh
source /root/DockerCLI/functions/execute.sh
source /root/DockerCLI/functions/trouble.sh
source /root/DockerCLI/functions/logs.sh
source /root/DockerCLI/functions/login.sh
source /root/DockerCLI/functions/status.sh
source /root/DockerCLI/functions/process.sh
source /root/DockerCLI/functions/network.sh
source /root/DockerCLI/functions/inspect.sh
source /root/DockerCLI/functions/search.sh

reset_color(){

	tput setaf 7
}

trap reset_color 2

trap reset_color 2

	tput setaf 2
echo -e  "\t\t\t\t  Select Any for Docker Cli Automate Program "
echo " "
	tput setaf 6
echo -e  "\t\t\t\t\t1  For Launching your container "
echo -e  "\t\t\t\t\t2  For Checking the status of the container "
echo -e  "\t\t\t\t\t3  For Deleting a container "
echo -e  "\t\t\t\t\t4  For Creating Docker Volumes "
echo -e  "\t\t\t\t\t5  Build a DockerFile "
echo -e  "\t\t\t\t\t6  Check Logs for a Container "
echo -e  "\t\t\t\t\t7  Process check in Container "
echo -e  "\t\t\t\t\t8  Execute Taks in a  Container "
echo -e  "\t\t\t\t\t9  To login in a Container "
echo -e  "\t\t\t\t\t10 Action On the Status of Container "
echo -e  "\t\t\t\t\t11 To Manage Network Settings  "
echo -e  "\t\t\t\t\t12 To inpect various components "
echo -e  "\t\t\t\t\t13 Search Image in DockerHub "

tput setaf 7
echo " "
read -p " Enter Your choice : " ch


case $ch in
	1)
		run
		;;
	2)
		
		status
		;;

	3) 
		delete
		;;

	4)	
		volume
		;;

	5)
		build
		;;

	6)
		logs
		;;

	7)
		process

		;;

	8)
		execute
		
		;;

	9)
		login

		;;

	10)
		trouble

		;;
	11)
		network
		;;
	12)
		inspect
		;;
	13)
		search

		;;
esac

}

