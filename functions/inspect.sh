#!/bin/bash

inspect(){
	tput setaf 2
	echo -e  "\t\t\t\t\t  Enter What you want to inspect :  "
	tput setaf 7
	read -p "Enter the Name: " option
	docker inspect $option | less

}


