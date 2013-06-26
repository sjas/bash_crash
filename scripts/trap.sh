#!/bin/bash

trap "echo Booh!" SIGINT SIGTERM

while :			# This is the same as "while true".
do
        echo "Loop..."
        sleep 5
done

