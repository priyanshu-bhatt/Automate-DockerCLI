#!/bin/bash

execute(){

                tput setaf 7
                read -p " Enter the Container to run the task: " name
                read -p  " Enter the Command/ Task to be Run: " cmd
                echo " "
                tput setaf 2
                echo -e  "\t\t\t\t #  Executing Task in $name Container # "
                echo " "
                tput setaf 7
                docker 'exec' $name $cmd

}
