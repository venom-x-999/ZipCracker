#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

animateText() {
    local text="Welcome Gys, I am Here"
    local delay="${1:-0.1}"  # Delay between ch>

    while true; do
        # Type the text
        for ((i=0; i<${#text}; i++)); do
            echo -n "${text:i:1}"
            sleep "$delay"
        done
        sleep 0.5  # Pause before clearing

        # Erase the text
        for ((i=0; i<${#text}; i++)); do
            echo -ne "\b \b"  # Remove one char>
            sleep "$delay"
        done
        sleep 0.5  # Pause before restarting
    done
}

printBanner(){
	clear
        echo ""
        echo -e "${GREEN}  ╔════════════════════════════════════════╗${RESET}"
        echo -e "${GREEN}  ║ ${RED}Ｚ${YELLOW}  Ｉ${BLUE}  Ｐ${GREEN}  Ｃ${RED}  Ｒ${YELLOW}  Ａ${BLUE}  Ｃ${GREEN}  Ｋ${RED}  Ｅ${YELLOW}  Ｒ${GREEN} ║${RESET}"
        echo -e "${GREEN}  ║                                        ║${RESET}"
        echo -e "${GREEN}  ║ ${YELLOW}𝔸𝕦𝕥𝕙𝕠𝕣: @𝕧𝕖𝕟𝕠𝕞${GREEN}                         ║${RESET}"
        echo -e "${GREEN}  ║ ${YELLOW}𝕍𝕖𝕣𝕤𝕚𝕠𝕟: 𝟙.𝟙${GREEN}                           ║${RESET}"
        echo -e "${GREEN}  ║ ${YELLOW}𝔾𝕚𝕥ℍ𝕦𝕓: 𝕙𝕥𝕥𝕡𝕤://𝕘𝕚𝕥𝕙𝕦𝕓.𝕔𝕠𝕞/𝕧𝕖𝕟𝕠𝕞-𝕩-𝟡𝟡𝟡 ${GREEN}║${RESET}"
        echo -e "${GREEN}  ╚════════════════════════════════════════╝${RESET}"

}

printBanner

zipCrack() {
    echo -e "${YELLOW}"
    read -p "Enter the path to the protected zip file: " zip_file
    read -p "Enter the path to the password file: " password_file
    echo -e "${RESET}"

    python3 <<EOF
import zipfile
import zlib

RED="${RED}"
GREEN="${GREEN}"
YELLOW="${YELLOW}"
BLUE="${BLUE}"
RESET="${RESET}"


def bruteforce_zip(zip_file, password_file):
    with open(password_file, 'r') as file:
        for password in file:
            password = password.strip()
            try:
                with zipfile.ZipFile(zip_file) as zf:
                    zf.extractall(pwd=password.encode())
                    print("\n")
                    print(f"{GREEN}[✓] Password found: [ {password} ]{RESET}")
                    print("\n")
                    print("Zip file unlocked and saved in the current directory.")
                    return
            except (zipfile.BadZipFile, RuntimeError, zlib.error):
                print(f"{RED}[✗] Incorrect password: {password}{RESET}")
    print(f"{RED}Password not found.{RESET}")

# Get inputs from Bash
zip_file = "${zip_file}"
password_file = "${password_file}"
bruteforce_zip(zip_file, password_file)
EOF
}

passGen() {
    local length=$1
    local max_number=$((10**length - 1))
    local format="%0${length}d"

    local counter=1
    while [[ -e "pass${counter}.txt" ]]; do
        ((counter++))
    done

    local filename="pass${counter}.txt"

    # Generate the password list and save to the file
    for ((i = 0; i <= max_number; i++)); do
        printf "$format\n" $i >> "$filename"
    done

    echo ""
    echo -e "${GREEN}Password list saved to $filename${RESET}"
}


exitTool() {
    echo -e "${RED}Exiting the tool...${RESET}"
    sleep 1
    exit 0
}

visitGitHub() {
    echo -e "${YELLOW}Opening GitHub account...${RESET}"
    xdg-open "https://github.com/venom-x-999" &>/dev/null || echo "Please open https://github.com/your-username manually."
}

############################
#  Tool created by @venom  #
#  creation date: 13/01/25 #
############################


#Main menu start
while true; do
    echo ""
    printf "${GREEN}[1] Start Attack\n"
    printf "${MAGENTA}[2] Pass Generator (Only number)\n"
    printf "${YELLOW}[3] Visit GitHub\n"
    printf "${RED}[4] Exit\n"
    echo ""
    printf "${BLUE}Enter your choice: ${RESET}"
    read choice

    case $choice in
        1)
            zipCrack
            ;;
	2)
	    sleep 1
	    echo ""
   	    read -p "Enter the length of password: " digits

            # Validate input
            if ! [[ $digits =~ ^[0-9]+$ ]] || [[ $digits -lt 1 ]]; then
                 echo -e "${RED}Please enter a valid positive integer.${RESET}"
                 exit 1
            fi

                 # Generate and save the password list
                 passGen $digits
	    ;;
        3)
            visitGitHub
            ;;
        4)
            exitTool
            ;;
        *)
            echo -e "${RED}Invalid choice. Please try again.${RESET}"
            ;;
    esac
done
