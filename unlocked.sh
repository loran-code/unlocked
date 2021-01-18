#!/bin/bash

# A script that is made to pull and execute on the computer of a colleague that
# has forgotten to lock his computer.

# Assign variables to methods
VAR=$(please)

# Start of the script
pick_random_function

# A function that requires all the basic commands to be preappended by the word "please" 
please () {
  #commands
  echo "this is the please function"
}

# A function that makes all the basic commands start a matrix style terminal
matrix () {
  if [matrix has not been downloaded]
  then
    sudo apt-get install cmatrix & sudo apt-get install cmatrix-font
  fi
  cmatrix
  #commands
}
 
# A function that sets the standard commands to different aliases
set_alias () {
  echo "this is the set alias function"
}

# Picks a random function to be executed when the script is run.
pick_random_function () {
  echo "this is the random function"
}