#!/bin/bash

# A script that is made to pull and execute on the computer of a colleague that
# has forgotten to lock his computer.

#TO DO
# Set URI path to correct user by variable (see set_background function) 


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
            set_background
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
  #commands
  alias ls='echo please_ls'
  alias please_ls="ls -F"
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
    # alias ls='cmatrix'
    # alias cd='cmatrix'
    # alias pwd='cmatrix'
    echo "this is the cmatrix function"
  fi
}

# Set a random desktop background
set_background () {
    r=$(( ( RANDOM % 7 )  + 1 ))
    echo $r
    return gsettings set org.gnome.desktop.background picture-uri file:////home/loran/Documents/red/unlocked/game5.jpeg
    # echo 'file:////home/loran/Documents/red/unlocked/game"${r}".jpeg'
}

# returns everything back to normal
backToNormal () {
  echo "alias ls='ls'" >> ~/.bashrc
  echo "alias cd='cd'" >> ~/.bashrc
  echo "alias pwd='pwd'" >> ~/.bashrc
  source ~/.bashrc
#   alias ls='ls'
#   alias cd='cd'
#   alias pwd='pwd'
  echo "this is the back to normal function" 
}


# Assign variables to methods
ISHOULDKNOWBETTERANDFEELBADABOUTMYACTIONS=$(backToNormal)

# Start script
pick_selection


