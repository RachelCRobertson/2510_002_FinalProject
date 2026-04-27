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

source ./read_data.sh
source ./auto_add_user.sh
source ./manual_add.sh
source ./manual_delete_user.sh
source ./licensing.sh
source ./show_all_users.sh
menu(){
	echo "Please select one of the following options"
	echo -e "\t1. Auto Account Creation from Link"
	echo -e "\t2. Add a User Manually"
	echo -e "\t3. List All Users"
	echo -e "\t4. Delete a User Manually"
	echo -e "\t5. Exit"
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
echo ""

# logic for main menu
while [[ $choice -ne '5' ]]; do
	menu

	read -p "> " choice

	while ! [[ $choice =~ ^[12345]$ ]]; do
		read -p "Invalid choice, please select 1, 2, 3, 4 or 5\n> " choice
	done

	if [[ $choice = '1' ]]; then
	     	# Pulls data from the website
		scrape

		# Adds user accounts
	        add_user
		echo "Restarting script..."
		source ./restart.sh
		sleep 5

	elif [[ $choice = '2' ]]; then
	        # Adds a user manually
		m_add
		echo "Restarting script..."
		source ./restart.sh
		sleep 5

	elif [[ $choice = '3' ]]; then
		# Shows all users on the system
		show_users

	elif [[ $choice = '4' ]]; then
		#deletes a user manually
		m_del
	fi

done

# removes username.txt
if test -f "username.txt"; then
	rm username.txt
fi
#removes staff.txt
if test -f "staff.txt"; then
	rm staff.txt
fi

echo ""
echo "The program has finished running."
echo ""

# Ends all running main.sh scripts
killall main.sh
