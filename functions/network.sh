#!/bin/bash

network(){
	tput setaf 6
	echo -e  "\t\t\t\t\t1  Enter to Create Network  "
	echo -e  "\t\t\t\t\t2  Enter to Delete Network "
	echo -e  "\t\t\t\t\t3  Enter to connect Network "
	echo -e  "\t\t\t\t\t4  Enter to disconnect a network "
	echo -e  "\t\t\t\t\t5  Enter to prune  Network  "
        echo -e  "\t\t\t\t\t6  Enter to list Network "
	tput setaf 7
	read -p "Enter What you want to Insepct: " option

	case $option in
		1)
			read -p " Enter Network  Name: " name
			read -p " Enter Driver Type: " driver

			docker network create -d $driver $name
			;;
		2)
			 read -p " Enter Network Name: " name
                        docker network rm $name
                        ;;

		3)
			read -p " Enter Network Name: " name
			read -p " Enter Container Name: " container

			docker network connect $name $container
			;;
		4) 
			read -p "Enter  Network Name: " name
			read -p "Enter Container ame: " container
			docker network disconnect $name $container
			;;
		5)
			tput setaf 2
			 echo -e  "\t\t\t\t\t  Removing All Unused Networks "
			 tput setaf 7
			docker network prune 
			;;
		6)
			tput setaf 2
			echo -e  "\t\t\t\t\t  Listing All Networks  "
			docker network ls
			tput setaf 7	

	esac

}


