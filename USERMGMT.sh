#!/bin/bash

# Define Color Variables 
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m' 
ENDCOLOR='\e[0m'   

#---------------------------------------------------------------------------
# Check Root Or Note

if [ "$EUID"  -ne 0 ];
then
echo "Plese run as Root User (sudo)"
exit 1
else
fi

#---------------------------------------------------------------------------- 
