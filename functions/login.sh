#!/bin/bash

login(){

                tput setaf 7
                read -p " Enter The Cotainer Name : " name
                for i in {1..5}
                do
                        tput setaf $i
                        echo -e  "\t\t\t\t #  Terminal Loading in $i seconds # ";       
                        sleep 1
                done
                tput setaf 7
                echo -e  "\t\t\t\t #   Welcome to $name container #  "
                echo " "
                docker exec -it $name /bin/bash
                


}
