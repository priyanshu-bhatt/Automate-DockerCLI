#!/bin/bash

logs(){
                tput setaf 7
                read -p " Enter the Container Name : " name
                docker logs --details $name
	}
