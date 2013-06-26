#!/bin/bash

ls -l | grep 'io'    # ls stdout is piped to grep stdin.

ls -l > newfile.txt  # send stdout to a file

echo "~~~~~~~~~~~~~~~~~~~~~" >> newfile.txt

ls -l >> newfile.txt # append to file.

echo "Contents of newfile.txt now: >>>>>>>>>>>>>>" && cat newfile.txt && echo "<<<<<<<<<<<<<<<<<<<<<<<<<<"

# Creates an empty file. You'll see error, since in a terminal, stderr goes to stdout by default.
echo -n "Expected error: " && ls -l nonexistent_file.txt > a.txt  

ls -l nonexistent_file.txt 2> a.err  # redirects stderr

cat a.err > a.txt 2>&1 # 1> is implied.
cat a.err 1>> a.txt 2>&1 
cat a.err &>> a.txt # same as above

echo "Contents of a.txt now, 1: >>>>>>>>>>>>>>" && cat a.txt && echo "<<<<<<<<<<<<<<<<<<<<<<<<<<"

cat nonexistent.txt >> a.txt 2>&1

echo "Contents of a.txt now, 2: >>>>>>>>>>>>>>" && cat a.txt && echo "<<<<<<<<<<<<<<<<<<<<<<<<<<"

rm -rf a.txt a.err newfile.txt
