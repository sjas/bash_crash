#!/bin/bash

while true
do
    echo "Are you sure?"
    read i
    if [ "$i" != "y" ] # -ne is for integer comparison, != is for string comparison
    then
        break
    fi
done
