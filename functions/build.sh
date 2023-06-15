#!/bin/bash

build(){

                tput setaf 7
                read -p " Enter the Dockerfile  file  : " dockerfile
                if ls ${dockerfile} &> /dev/null
                then

                        read -p " Enter the image Name eg: DockerHub UserName /ImageName : " image
                        docker build -t $image -f $dockerfile .
                        tput setaf 7
                        docker images
                        echo " "
                        read -p  " DO YOU Want to Upload This Image to Dockerhub: (yes/no) " push
                        if [ $push == yes ]
                        then
                                tput setaf 2
                                echo " Pushing image to Docker Hub Account: "
                                tput setaf 7
                                read -p " Enter Your Dockerhub UserName : " username
                                read -s  -p " Enter Your DockerHub Password : " password

                                if docker login -u $username -p $password &> /dev/null
                                then
                                        echo " "
                                        tput setaf 2
                                        echo -e  "\t\t\t\t  #  LOGIN SUCCESSFULL # "
					                                        echo " "
                                        tput setaf 7
                                else
                                        tput setaf 1
                                        echo  -e  "\t\t\t\t # Login Failed # "
                                        tput setaf 7
                                fi
                        else
                                tput setaf 6
                                echo " Thanks for Using Docker Automate TryAgain "
                                tput setaf 7
                                exit
                        fi
                else
                        tput setaf 1
                        echo  -e  "\t\t\t\t # file doesn't exist # "
                        tput setaf 7
                fi


}
