# ZipCracker

This is a simple yet powerful Bash script designed to brute-force password-protected zip files. With an intuitive user interface, it allows users to quickly test a list of passwords against a locked zip file. The tool is easy to use and boasts a high success rate for cracking zip file passwords when the correct password is present in the provided list.

## Features

• *User-Friendly*: Just provide the path to the zip file and the password list, and the tool does the rest.

• *High Success Rate*: Efficiently tests passwords until the correct one is found or the list is exhausted.

• *Customizable*: Modify the script to suit your specific needs.

## Installation

1. *Install dependencies*:

   ```bash
   apt update -y
   apt upgrade -y
   apt install git
   apt install python
   apt install zlib
   apt install unzip
   
2. *Clone the repository*:
   
   ```bash
   git clone https://github.com/venom-x-999/ZipCracker.git
   cd ZipCracker
   chmod +x zipcracker.sh
   ./zipcracker.sh

## Usages

1. *Input the Path to the Protected Zip File*: Enter the full path of the locked zip file you want to crack.
 
2. *Input the Path to the Password File*: Provide a text file containing a list of potential passwords (one password per line).
   
3. *Let the Tool Work*: The script will try each password in the list until it finds the correct one or finishes the list.

## Screenshot

<img align="right" alt="Coding" width="300" src="https://github.com/venom-x-999/ZipCracker/blob/main/ss1.png">

<img align="right" alt="Coding" width="300" src="https://github.com/venom-x-999/ZipCracker/blob/main/ss2.png">
