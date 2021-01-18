#!/bin/bash

# A script that is made to pull and execute on the computer of a colleague that
# has forgotten to lock his computer.


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
            matrix
            ;;
        "set background")
            set_background
            ;;
        "return to normal")
            backToNormal
            ;;
        "Quit")
            echo "Stopping the program"
            break
            ;;
        *) echo "invalid option \"$REPLY"\";;
    esac
done
}


# A function that requires all the basic commands to be preappended by the word "please" 
please () {
  #commands
  echo "this is the please function"
  return 
}

# A function that makes all the basic commands start a matrix style terminal
matrix () {
  if ! command -v cmatrix &> /dev/null; then
    sudo apt-get install cmatrix & sudo apt-get install cmatrix-font
  else
    cmatrix
  fi
}
 
# A function that sets the standard commands to different aliases
set_alias () {
     #args : string firstName
  echo "this is the set alias function"
}



set_background () {
   echo "this is the background function" 
   # Set the game.jpg as background
}

# returns everything back to normal
backToNormal () {
  echo "this is the back to normal function" 
}

# Assign variables to methods
ISHOULDKNOWBETTERANDFEELBADABOUTMYACTIONS=$(backToNormal)

# Start of the script
pick_selection

echo $ISHOULDKNOWBETTERANDFEELBADABOUTMYACTIONS

# removes bash command history, so there are no signs that this script has been run
cat /dev/null > ~/.bash_history && history -c