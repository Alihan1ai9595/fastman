# MM    MM              dd           bb                         lll  1  hh      333333
# MMM  MMM   aa aa      dd   eee     bb      yy   yy      aa aa lll 111 hh         3333 nn nnn
# MM MM MM  aa aaa  dddddd ee   e    bbbbbb  yy   yy     aa aaa lll  11 hhhhhh    3333  nnn  nn
# MM    MM aa  aaa dd   dd eeeee     bb   bb  yyyyyy    aa  aaa lll  11 hh   hh     333 nn   nn
# MM    MM  aaa aa  dddddd  eeeee    bbbbbb       yy     aaa aa lll 111 hh   hh 333333  nn   nn
#                                             yyyyy
# Support - al1h3n(tg,ds) | Donate me - paypal.me/al1h3n
# Fastman v1 - Find your main pacman mirror.
# Part of the Cleanus Pack.
# ==============================================================================

#!/bin/bash
echo -e "\033]0;Fastman v1 - al1h3n\007"
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

if [ $EUID -ne 0 ];then
   echo -e "${YELLOW}Elevation needed. Restarting with sudo..${RESET}"
   exec sudo /bin/bash "$0" "$@"
fi

echo -e "\033[38;5;213mFastman by\033[0m \033[38;5;171mal1h3n${RESET}"

exists(){
	command -v $1&>/dev/null
}

if exists pacman;then # Arch, Endeavour, Cachy, Manjaro etc.
pacman -S reflector curl jq --needed --noconfirm
reflector -c $(curl -s ipinfo.io/json | jq -r '.country') --save /etc/pacman.d/mirrorlist
echo -e "\n\033[38;5;46mWe updated your pacman mirror file in /etc/pacman.d/mirrorlist.${RESET}"

else
echo -e "${RED}You don't have pacman, it's obvious. Exiting.${RESET}"
fi
