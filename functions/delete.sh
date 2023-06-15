#!/bin/bash

delete()
{
	         tput setaf 7
                read -p "Enter your Container Name: " name
        #       docker ps -a --format '{{.Names}}' > container_name.txt
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
	}	

		
