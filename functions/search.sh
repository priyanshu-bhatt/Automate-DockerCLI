#!/bin/bash

search(){

	read -p " Enter the Image Name: " name
	docker search --format "table {{.Name}}\t{{.IsAutomated}}\t{{.IsOfficial}}" $name

}

