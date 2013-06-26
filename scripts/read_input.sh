#!/bin/bash

# Functions: The first reverses strings. The second adds numbers.
mess_with () 
{ 
  result=()
  until [ -z "$1" ] # until $1 is empty...
  do
    result+=(`echo $1|rev`)
    shift           # shift $2 to $1, $3 to $2, etc...
  done
  printf -- 'letters reversed: %s \n' "`echo ${result[@]}`"
  printf -- 'words reversed: %s \n' "`for (( idx=${#result[@]}-1 ; idx>=0 ; idx-- )) ; do echo -n \"${result[idx]} \"; done`"

}

add_to () 
{ 
  local number=0
  until [ -z "$1" ] # until $1 is empty...
  do
    let "number += $1"
    echo -n "$number "
    shift           # shift $2 to $1, $3 to $2, etc...
  done

  echo # newline
}


echo $$
echo "waiting on you to type groups of letters..."

read i #wait until user types something 

echo "Got it, sort-of: `mess_with $i`"

echo "waiting on you to type groups of numbers..."

read i #wait until user types something 

echo "Got it, sort-of: `add_to $i`"

