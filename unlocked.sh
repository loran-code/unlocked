#!/bin/bash

# A script that is made to pull and execute on the computer of a colleague that
# has forgotten to lock his computer.


#TO DO
# Set URI path to correct user by variable (see set_background function) 
CURRENTDIR=$(pwd)


# Picks a function to be executed when the script is run.
pick_selection () {
  cat unlocked.txt
  PS3='Please enter your choice: '
options=("prepend \"please\"" "matrix terminal" "set background" "return to normal" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "prepend \"please\"")
            please
            ;;
        "matrix terminal")
            matrix cmatrix
            ;;
        "set background")
            background
            ;;
        "return to normal")
            backToNormal
            ;;
        "Quit")
            history -c #Cleans the history command
            source ~/.bashrc
            clear
            break
            ;;
        *) echo "invalid option \"$REPLY"\";;
    esac
done
}


# A function that requires all the basic commands to be preappended by the word "please" 
please () {
  echo "alias ls='echo please_ls'" >> ~/.bashrc 
  echo "alias please_ls='ls -F'" >> ~/.bashrc 
  
  source ~/.bashrc
  echo "this is the please function"

  return 
}


# A function that makes all the basic commands start a matrix style terminal
matrix () {
  if ! command -v cmatrix &> /dev/null; then
    sudo apt-get install cmatrix & sudo apt-get install cmatrix-font
  else
    echo "alias ls='cmatrix'" >> ~/.bashrc
    echo "alias cd='cmatrix'" >> ~/.bashrc
    echo "alias pwd='cmatrix'" >> ~/.bashrc
    source ~/.bashrc
    echo "cmatrix" >> ~/.profile
    # alias ls='cmatrix'
    # alias cd='cmatrix'
    # alias pwd='cmatrix'
    echo "this is the cmatrix function"
  fi
  return 
}


# Set a random desktop background
background () {

	DPMG="$(checkDisto)"
	if [[ -z $DPMG ]]; then
		echo "Displaymanager is not recognized"
	else
		RANDNUM=$(( $RANDOM %7))
		IMGTOSET=$CURRENTDIR"/game"$RANDNUM".jpeg"

		case $DPMG in
			"kali")
                         	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s $IMGTOSET
			  	;;
		        "ubuntu")
			      	gsettings set org.gnome.desktop.background picture-uri file:///$IMGTOSET	
				;;
			*) echo $DPMG
				;;
		esac
	fi
  return 
}


checkDisto () {
	KALIORUBUNTU=$(uname -a | awk '{print $3}' | awk -F- '{print $2}')
	if [[ $KALIORUBUNTU == "kali5" ]]; then
		echo "kali"
	else
		KALIORUBUNTU=$(uname -a | awk '{print $4}' | awk -F- '{print $2}')
	fi

	if [[ $KALIORUBUNTU == "Ubuntu" ]]; then
		echo "ubuntu"
	fi
  return 
}


# returns everything back to normal
backToNormal () {
  echo "alias ls='ls'" >> ~/.bashrc
  echo "alias cd='cd'" >> ~/.bashrc
  echo "alias pwd='pwd'" >> ~/.bashrc
  source ~/.bashrc
  sed -e s/cmatrix//g -i ~/.profile
#   alias ls='ls'
#   alias cd='cd'
#   alias pwd='pwd'
  echo "this is the back to normal function" 
  return 
}


# Assign variables to methods
ISHOULDKNOWBETTERANDFEELBADABOUTMYACTIONS=$(backToNormal)


# Start script
pick_selection


