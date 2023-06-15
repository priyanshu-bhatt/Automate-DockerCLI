#!/bin/bash

run(){
  tput setaf 7
                read -p "Enter the Name of the Container: " name
        #       docker ps -a --format '{{.Names}}' > container_name.txt
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
	}
