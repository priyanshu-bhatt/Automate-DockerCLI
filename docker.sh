#!/bin/bash

echo " "
tput setaf 2
echo -e  "\t\t\t\t\t # 🐳  Hello Sir Welcome to Docker Automate Program 🐳  #"
echo " "
tput setaf 3
read -p "Enter your Input YES/NO to setup Docker Services : " input

echo " "

reset_color(){

	tput setaf 7
}

trap reset_color 2

container(){
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

tput setaf 7
echo " "
read -p " Enter Your choice : " ch


case $ch in
	1)
		tput setaf 7
		read -p "Enter the Name of the Container: " name
	#	docker ps -a --format '{{.Names}}' > container_name.txt
		if  [ $(docker ps -qa -f name=$name$) ] &> /dev/null
		then
			tput setaf 1
			echo -e  "\t\t\t\t  Container Name Exist please try different Name "
			tput setaf 7
		else
			read -p "Enter the Image Name: " image
			docker run -dit --name $name $image
			tput setaf 2
			echo -e  "\t\t\t\t # Container Launched Succesfully # "
			tput setaf 7
		fi

		
		;;
	2)
		
		tput setaf 2
		echo -e  "\t\t\t\t #  The Status of the Contanier are #  "
		echo " "
		docker ps -a
		tput setaf 7
		;;

	3) 
		tput setaf 7
		read -p "Enter your Container Name: " name
	#	docker ps -a --format '{{.Names}}' > container_name.txt
		if [ $(docker ps -q -f name=$name$) ]  &> /dev/null 
		then
			tput setaf 2
			echo -e  "\t\t\t\t #  Deleting $name Container # "
			echo " "
			docker rm -f $name
			tput setaf 7
		else
			tput setaf 1
			echo -e  "\t\t\t\t # Container Doesn't Exist # "
			tput setaf 7
		fi
		;;
	4)	
		tput setaf 2
		echo -e  "\t\t\t\t #  Creating Docker Volume # "
		echo " "
	#	docker volume ls --format '{{.Name}}' > volumes.txt
		tput setaf 7
		read -p " Enter The name for the volume : " name
		if [ $(docker volume ls -q -f name=$name$) ] &> /dev/null
		then
			tput setaf 1	
			echo -e  "\t\t\t\t #  Docker Volume Already Exist # "
			echo " "
			tput setaf 7
		else
			tput setaf 2
			echo -e  "\t\t\t\t #  Docker Volume Created # "
			docker volume create $name
			tput setaf 7
		fi
		;;

	5)
		tput setaf 7
		read -p " Enter the Dockerfile  file  : " dockerfile
		if ls ${dockerfile} &> /dev/null
		then
			
			read -p " Enter the image Name eg: DockerHub UserName /ImageName : " image
			docker build -t $image -f $dockerfile .
			tput setaf 7
			docker images
			echo " "
			read -p  " DO YOU Want to Upload This Image to Dockerhub: (yes/no) " push
			if [ $push == yes ]
			then
				tput setaf 2
				echo " Pushing image to Docker Hub Account: "
				tput setaf 7
				read -p " Enter Your Dockerhub UserName : " username
				read -s  -p " Enter Your DockerHub Password : " password

				if docker login -u $username -p $password &> /dev/null
				then
					echo " "
					tput setaf 2
					echo -e  "\t\t\t\t  #  LOGIN SUCCESSFULL # "
					echo " "
					tput setaf 7
				else
					tput setaf 1
					echo  -e  "\t\t\t\t # Login Failed # "
					tput setaf 7
				fi
			else
				tput setaf 6
				echo " Thanks for Using Docker Automate TryAgain "
				tput setaf 7
				exit
			fi
		else
			tput setaf 1
			echo  -e  "\t\t\t\t # file doesn't exist # "
			tput setaf 7
		fi
		;;	
	6)
		tput setaf 7
		read -p " Enter the Container Name : " name
		docker logs --details $name
		;;
	7)
		tput setaf 2
		echo -e  "\t\t\t\t # Printing top Process in the container # "
		echo " "
		tput setaf 7
		read -p "Enter the Container Name : " name
		docker top $name
		;;
	8)
		tput setaf 7
		read -p " Enter the Container to run the task: " name
		read -p  " Enter the Command/ Task to be Run: " cmd
		echo " "
		tput setaf 2
		echo -e  "\t\t\t\t #  Executing Task in $name Container # "
		echo " "
		tput setaf 7
		docker 'exec' $name $cmd
		
		;;	
	9)
		tput setaf 7
		read -p " Enter The Cotainer Name : " name
	       	for i in {1..5}
		do
			tput setaf $i
			echo -e  "\t\t\t\t #  Terminal Loading in $i seconds # "; 	
			sleep 1
		done
		tput setaf 7
		echo -e  "\t\t\t\t #   Welcome to $name container #  "
		echo " "
		docker exec -it $name /bin/bash
		;;

	10)
		tput setaf 7
		read -p "Enter the Container Name: " name
		if [  $(docker ps -qa --filter name=$name$) ]  &> /dev/null
        	then
                	if [ $(docker ps -aq --filter status=running --filter name=$name$) ] &> /dev/null
                	then
				tput setaf 2

                        	echo  -e  "\t\t\t\t #  Container in Running state # "
				tput setaf 7
                	else
				tput setaf 2
                        	echo  -e  "\t\t\t\t # Restarting the container # "
				tput setaf 7
                		docker start $name
                	fi
        	else
			tput setaf 1
                	echo " Container Doesn't Exist  " 
			tput setaf 7
        	fi
		;;

esac

}


if [[ $input == yes || $input == YES ]]
then
		 
	yum install docker -y &> /dev/null
	systemctl start docker
	systemctl enable docker 
	tput setaf 2
	echo -e  "\t\t\t\t Docker setup Done Services started succesfully"
	tput setaf 7
	container
	
else
	echo " "
	tput setaf 6
	echo -e  "\t\t\t\t #  Thanks See You  !! #"
	echo " "
	tput setaf 7
fi
