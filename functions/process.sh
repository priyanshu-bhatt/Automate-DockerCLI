#!/bin/bash

process(){
		tput setaf 2
                echo -e  "\t\t\t\t # Printing top Process in the container # "
                echo " "
                tput setaf 7
                read -p "Enter the Container Name : " name
                docker top $name
	}
