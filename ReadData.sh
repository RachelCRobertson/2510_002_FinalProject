#!/bin/bash

scrape(){
	curl -s https://www.tntech.edu/engineering/programs/csc/faculty-and-staff.php
	| grep -oP '(?<=<h4><strong>)[^,<]*' | tr '\n' '#' | tr -d '\r' | sed 's/&nbsp;//g' | sed 's/#$/\n/'
}

