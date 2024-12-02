#!/bin/bash

myIP=$(bash /home/champuser/sys-320-1/week10/IPAddress.bash)


# Todo-1: Create a helpmenu function that prints help for the script
function HelpMenu(){
helpMenuText=\
"\n   HELP MENU  \n"\
" -------------------------------------------------------- \n"\
" -n: Add -n as an argument for this script to use nmap\n"\
"   -n external: External NMAP scan\n"\
"   -n internal: Internal NMAP scan\n"\
" -s: Add -s as an argument for this script to use ss\n"\
"   -s external: External ss(Netstat) scan\n"\
"   -s internal: Internal ss(Netstat) scan\n\n"\
" Usage: bash networkchecker.bash -n/-s external/internal\n"\
" -------------------------------------------------------- \n"


echo -e "${helpMenuText}"

}

# Return ports that are serving to the network
function ExternalNmap(){
  rex=$(nmap "${myIP}" | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}

# Return ports that are serving to localhost
function InternalNmap(){
  rin=$(nmap localhost | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}


# Only IPv4 ports listening from network
function ExternalListeningPorts(){
# Todo-2: Complete the ExternalListeningPorts that will print the port and application
# that is listening on that port from network (using ss utility)
elpo=$(ss -ltpn | tail -n +2 | sed -e 's/[//g' | awk  -F"[[:space:]]+" '!/127.0.0./') # {print $4,$6}' ) #| tr -d "\"")
}


# Only IPv4 ports listening from localhost
function InternalListeningPorts(){
ilpo=$(ss -ltpn | awk  -F"[[:space:]:(),]+" '/127.0.0./ {print $5,$9}' | tr -d "\"")
}



# Todo-3: If the program is not taking exactly 2 arguments, print helpmenu

InternalListeningPorts

ExternalListeningPorts

echo "${ilpo}"
echo -e "\n\n ----- \n\n"
echo "${elpo}"



# Todo-4: Use getopts to accept options -n and -s (both will have an argument)
# If the argument is not internal or external, call helpmenu
# If an option other then -n or -s is given, call helpmenu
# If the options and arguments are given correctly, call corresponding functions
# For instance: -n internal => will call NMAP on localhost
#               -s external => will call ss on network (non-local)


