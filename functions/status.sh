#!/bin/bash

status(){
                tput setaf 2
                echo -e  "\t\t\t\t #  The Status of the Contanier are #  "
                echo " "
                docker ps -a
                tput setaf 7
	}
