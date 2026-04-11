#!/bin/bash

#main Script for application
source ./R_data.sh
source ./add_user_accounts.sh
source ./mannualAdd.sh
source ./licensing.sh

menu(){
	echo "Please select on of the following options"
	echo -e "\t1. Auto Account Creation from Link"
	echo -e "\t2. Add a User Manually"
	echo -e "\t3. Exit" 
}

RED="\033[0;31m"
WHITE="\033[0m"

${RED}
${WHITE}

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
echo "Developed by RedDragon"
echo "Property of DEELTECH"
echo "User Account Automation V1.0"
# need to remove auto call to main
#validate_license

while [[ $choice -ne '3' ]]; do
	menu

	read -p "> " choice

	while ! [[ $choice =~ ^[123]$ ]]; do
		read -p "Invalid choice, please select 1, 2, or 3\n> " choice
	done

	# make the feature into a function and call it
	if [[ $choice = '1' ]]; then
	     #	scrape_data
	     #	add_user_accounts
		echo "Scraped"

	elif [[ $choice = '2' ]]; then
	     #	mannualAdd
		echo "Mannually added"
	fi
done

echo "The program has finished running."
