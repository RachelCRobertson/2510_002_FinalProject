#!/bin/bash

#-----------------------------------------
#Filename:    read_data.sh
# Author:     RedDragon, Zachary Seitner
# Purpose:    Provides the scrape()
#             function that reads data
# from a website and outputs all the unique
# names into a text file.
#
# Functionality:
#       1. Scrape website
#       2. Output names in staff.txt
#-----------------------------------------

scrape(){
	echo "Pulling data from website..."
	curl -s https://www.tntech.edu/engineering/programs/csc/faculty-and-staff.php |  
	grep -oP '(?<=<h4><strong>)[^,<]*' |
	tr '\n' '#' |
	tr -d '\r' |
	sed 's/&nbsp;//g' |
	sed 's/#$/\n/' > staff.txt
}
