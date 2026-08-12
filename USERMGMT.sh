#!/bin/bash

# Define Color Variables 
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m' 
ENDCOLOR='\e[0m'   

#---------------------------------------------------------------------------
#============================================================================
# Check Root Or Note

	if [ "$EUID"  -ne 0 ];
	then
	echo "Plese run as Root User (sudo)"
	exit 1
	fi
#-------------------------------------------------------------------------------
#============================================================================
# 1 Creat User Functin
	create_user(){
			read -p "Enter Username : " username
	if id "$username" &>/dev/null;
	then
		echo "User already exists !"
	else
		useradd -m  "$username" 
		passwd "$username"
		echo "User Created Successfully."
		
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
                echo "User Is Deleted..."
        else    
                echo "User Not found"
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
            echo "Password Was Changed"
        else    
            echo "User Not Found"    
         fi   
    }
#============================================================================
# 4 Lock User Functin
#============================================================================
# 5 Unlock User Functin
#============================================================================
# 6 Add User to Group Functin
#============================================================================

    # Main Menu
	while true
	do
echo "================================================================"
echo -e "        ${YELLOW}USER MANAGEMENT SYSTEM BY SANJAY THAKOR${ENDCOLOR}"
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
            echo -e "${RED}Invalid Choice!${ENDCOLOR}"
            ;;
    esac

    echo
    read -p "Press Enter To Continue..."
done
#------------------------------------
#======================================

