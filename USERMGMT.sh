#!/bin/bash

# Define Color Variables
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
RESET='\e[0m'
CYAN='\033[36m'
BOLD='\e[1m'
MAGENTA='\e[35m'

#---------------------------------------------------------------------------

#============================================================================
# Check Root Or Note

	if [ "$EUID"  -ne 0 ];
	then
	echo -e "${YELLOW}${BOLD}Please run as root (using sudo).${RESET}"
	exit 1
	fi
#-------------------------------------------------------------------------------
#============================================================================
# 1 Creat User Functin
	create_user(){
			read -p "Enter Username : " username
	if id "$username" &>/dev/null;
	then
		echo -e "${YELLOW}${BOLD}User already exists.${RESET}"
	else
		useradd -m  "$username"
		passwd "$username"
		echo -e "${GREEN}${BOLD}✓ User created successfully.${RESET}"

	fi
	}
#----------------------------------------------------------------------------
#============================================================================
# 2 Delete User Functin
    delete_user(){
                read -p "Enter Username : " username
        if id "$username" &>/dev/null;
        then
                userdel -r "$username"
               echo -e "${GREEN}${BOLD}✓ User deleted successfully.${RESET}"
        else
                echo -e "${RED}${BOLD}User not found.${RESET}"
        fi
    }
#-------------------------------------------------------------------------------
#============================================================================
# 3 Change User Password Functin
    change_password(){
                        read -p "Enter Username : " username
        if id "$username" &>/dev/null;
        then
            passwd "$username"
            echo -e "${GREEN}${BOLD}✓ Password changed successfully.${RESET}"
        else
            echo -e "${RED}${BOLD}User not found.${RESET}"
         fi
    }
#------------------------------------------------------------------------------
#============================================================================
# 4 Lock User Functin
    lock_user() {
                         read -p "Enter Username : " username
        if id "$username" &>/dev/null;
        then
            passwd -l "$username"
            echo -e "${GREEN}${BOLD}✓ User locked successfully.${RESET}"
        else
            echo -e "${RED}${BOLD}User not found.${RESET}"
         fi
             }
#----------------------------------------------------------------------------
#============================================================================
# 5 Unlock User Functin
    unlock_user() {
                         read -p "Enter Username : " username
        if id "$username" &>/dev/null;
        then
            passwd -u "$username"
            echo -e "${GREEN}${BOLD}✓ User unlocked successfully.${RESET}"
        else
            echo -e "${RED}${BOLD}User not found.${RESET}"
         fi
             }
#-------------------------------------------------------------------------------
#============================================================================
# 6 Add User to Group Functin
    add_user_to_group() {
                        read -p "Enter Username  : " username
                        read -p "Enter Groupname : " group
        if id "$username" &>/dev/null;
        then
                if getent group "$group" &>/dev/null;
                then
                usermod -aG "$group" "$username"
                echo -e "${green}${BOLD}✓ User added successfully.${RESET}"
            else   
                echo -e "${RED}${BOLD}Group not found.${RESET}"
                fi    
        else
            echo -e "${RED}${BOLD}User not found.${RESET}"
        fi
 }
 #-------------------------------------------------------------------------------
#============================================================================
# 7 Remove User to Group Functin
    remove_user_from_group(){
                            read -p "Enter Username  : " username
                            read -p "Enter Groupname : " group
        if id "$username" &>/dev/null;
        then
            if getent group "$group" >/dev/null;
                then
                    gpasswd -d "$username" "$group"
                    echo -e "${GREEN}${BOLD}User removed from Group Successfully.${RESET}"
                    else    
                            echo -e "${RED}${BOLD}Group Not Found. ${RESET}"
                     fi
        else
            echo -p "${RED}${BOLD}User Not Found. ${RESET}" 
        fi                      
    }
#============================================================================
    # Main Menu
	while true
	do
echo "================================================================"
echo -e "        ${YELLOW}${BOLD}USER MANAGEMENT SYSTEM BY SANJAY THAKOR${RESET}"
echo "================================================================"
    echo "1.  Create User"
    echo "2.  Delete User"
    echo "3.  Change User Password"
    echo "4.  Lock User"
    echo "5.  Unlock User"
    echo "6.  Add User to Group"
    echo "7.  Remove User From Group"
    echo "8.  User Information"
    echo "9.  List Users"
    echo "10. Exit"
    echo "================================================================"

    read -p "Enter your choice: " choice

    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) change_password ;;
        4) lock_user ;;
        5) unlock_user ;;
        6) add_user_to_group ;;
        7) remove_user_from_group ;;
        8) user_info ;;
        9) list_user ;;
        10)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo -e "${RED}${BOLD}Invalid Choice!${RESET}"
            ;;
    esac

    echo
    read -p "Press Enter To Continue..."
done
#------------------------------------
#======================================

