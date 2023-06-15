#!/bin/bash

trouble(){

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


}
