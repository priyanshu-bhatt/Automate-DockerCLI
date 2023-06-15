#!/bin/bash

volume(){
                tput setaf 2
                echo -e  "\t\t\t\t #  Creating Docker Volume # "
                echo " "
        #       docker volume ls --format '{{.Name}}' > volumes.txt
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




}
