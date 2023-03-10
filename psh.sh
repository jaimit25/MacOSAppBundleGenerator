#!/bin/bash
function psh(){

	# clear the contents of the test file
	rm test
	echo -n "" > test.cpp

	# Process for Github - push
	echo "Enter Message :"
	read mssg
	dt=$(date)
	echo "$dt"
	if [ -z "$mssg" ] 
	then  
		echo "message cannot be empty" 
	else 	
		git add .
		git commit -m"${mssg} | $dt "
		git push
		echo "Pushed to MacOSAppBundleGenerator Repository :)" 
	fi 
}


psh