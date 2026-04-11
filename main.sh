#!/bin/bash

#-----------------------------------------
# Filename:   main.sh
# Author:     RedDragon, Rachel Robertson
# Purpose:    Provides a UI for account
#	      creation automation.
# Functionality:
#	1. Add users automatically
#	   from a link.
#	2. Add users manually
#-----------------------------------------


#main Script for application

source ./ReadData.sh
source ./auto_add_user.sh
source ./manualAdd.sh
source ./licensing.sh
source ./delete_user.sh

menu(){
	echo "Please select on of the following options"
	echo -e "\t1. Auto Account Creation from Link"
	echo -e "\t2. Add a User Manually"
	echo -e "\t3. Exit" 
}

RED="\033[0;31m"
WHITE="\033[0m"

echo ""
echo ""
echo -e  "                       ##################"
echo -e  "                 #######%%@@@@@@@@%%###########"
echo -e  "              ####%@@@@@@@@@@@@@@@%#${RED}+--==*${WHITE}######"
echo -e  "           ####%@@@@@@@@@@%%%#${RED}+-:   .*.=- .-=${WHITE}####"
echo -e  "         ####@@@@@@@@@@@@#${RED}*.    -...+.+- ----${WHITE}######"
echo -e  "       ####@@@@@@@@@@@@${RED}@*++..-.:-+-#.*#*########+${WHITE}###"
echo -e  "      ###@@@@@@@@@@@@@@${RED}*=.-.*..=-##:-######**=.....${WHITE}###"
echo -e  "     ##%@@@@@@@@@@@@@@${RED}*.++-=+-####:-*#*++--=++-=::-=*${WHITE}##"
echo -e  "   ###@@@@@@@@@@@@@@#${RED}-.:=-=**####*++=.-+:=-.-.-*#*.-==${WHITE}##"
echo -e  "   ##@@@@@@@@@@@@@#${RED}-..+=-+*###-.-+---:-=..*=:===+##--:*${WHITE}##"
echo -e  "  ##%@@@@@@@@@@@#${RED}+-..#+*-*:..+*+:....  =:.*=****+-*#::+*${WHITE}##"
echo -e  " ##%@@@@@@@@@@${RED}*.+*+.:*##:=${WHITE}*:+#*:${RED}  :- :=. ..-+=**...#+..+${WHITE}###"
echo -e  " ##@@@@@@@%${RED}*-.. ++-==##.${WHITE} :+=##=*=${RED}     ....+= .-++#=.==::+${WHITE}##"
echo -e  "###@@@%${RED}-  .  .  +.:*##:=-${WHITE}++#-.#+-${RED}.: .-.=. ..--.:....+=.:=${WHITE}###"
echo -e  "##%@@@@${RED}*  :-..-=+-##*. -- ${WHITE}.*+=**${RED}-.:.. .:    ::.:+.  -#${WHITE}%@@@%##"
echo -e  "##@@@@@${RED}*+..++.**#+*+:=:-:. ..      : .   .=.+:+.-:${WHITE}%@@@@@@@##"
echo -e  "##@@@@@${RED}%-=+:*####-.  ..:=*=:    :***+  .=.:. -.-.${WHITE}%@@@@@@@@##"
echo -e  "##@@@@@@${RED}=+###*-.  .:*.-*-=.-+#=+=. .*. ..+:-:: :-${WHITE}@@@@@@@@@##"
echo -e  "##%@@@@@${RED}+=+. .=-:  :-   :.**${WHITE}@@@${RED}#.=:=..:= .+:+-.*${WHITE}@@@@@@@@@%##"
echo -e  "###@@@@@@${RED}-  ..-::=::.==:-${WHITE}#%@@@@${RED}%+=.:.*..-*:..=${WHITE}@@@@@@@@@@@###"
echo -e  " ##@@@@@@#${RED}. .:=..*.*#${WHITE}@@@%@@@@${RED}#.  -:=+.-:.: -%${WHITE}@@@@@@@@@@@@##"
echo -e  " ###@@@@@@${RED}* .:**@%*${WHITE}@@@@@@@@@@${RED}#..-=...++..-${WHITE}#@@@@@@@@@@@@@###"
echo -e  "  ##%@@@@@@${RED}*${WHITE}##@@@@@@@@@@@@@@@@${RED}..#.+-- .+${WHITE}@@@@@@@@@@@@@@@%##"
echo -e  "   ##@@@@@@@@@@@@@@@@@@@@@@@@%${RED}.:#.== .${WHITE}#@@@@@@@@@@@@@@@%##"
echo -e  "    ##%@@@@@@@@@@@@@@@@${RED}%**%@#-=#:.=.:${WHITE}#@@@@@@@@@@@@@@@%##"
echo -e  "     ##%@@@@@@@@@@@@@@@@@${RED}%%%@@%- -.--${WHITE}@@@@@@@@@@@@@@@%##"
echo -e  "      ###@@@@@@@@@@@@@@@@@${RED}%%%#-. ..-${WHITE}%@@@@@@@@@@@@@@###"
echo -e  "        ###@@@@@@@@@@@@@@@@${RED}*.   --*${WHITE}@@@@@@@@@@@@@@###"
echo -e  "         ####@@@@@@@@@@@@@@@@#${RED}-.:${WHITE}%@@@@@@@@@@@@@####"
echo -e  "           ####%@@@@@@@@@@@@@@@@@@@@@@@@@@@@%####"
echo -e  "              #####%@@@@@@@@@@@@@@@@@@@@@%#####"
echo -e  "                 #######%%%@@@@@@%%%#######"
echo -e  "                       ##############"
echo -e  "\t\t  Developed by RedDragon"
echo -e  "\t\t   Property of DEELTECH"
echo -e  "\t\tUser Account Automation V1.0"


validate_license

# logic for main menu
while [[ $choice -ne '3' ]]; do
	menu

	read -p "> " choice

	while ! [[ $choice =~ ^[123]$ ]]; do
		read -p "Invalid choice, please select 1, 2, or 3\n> " choice
	done

	if [[ $choice = '1' ]]; then
	     	# Pulls data from the website
		scrape

		# Adds user accounts
	        add_user

	elif [[ $choice = '2' ]]; then
	        # Adds a user manually
		MAdd
	fi
done

# delete_user

echo "The program has finished running."
