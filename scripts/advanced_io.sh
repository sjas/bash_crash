#!/bin/bash
#
# From http://www.tldp.org/LDP/abs/html/io-redirection.html
#
# Advanced descriptors:

echo 1234567890 > File    # Write string to "File".
cat File
exec 3<> File             # Open "File" and assign fd 3 to it.
read -n 4 <&3             # Read only 4 characters.
echo -n . >&3             # Write a decimal point there (similar to "seek/lseek").
exec 3>&-                 # Close fd 3: prevents fd inheritance.
cat File                  # ==> 1234.67890

# File I/O:

# How I created the yes.txt input file: requires  Ctrl-C, so cannot be scripted.
# $ yes > yes.txt
# ^C
# $ wc -l yes.txt 
# 14639104 yes.txt
# $ tail -10000 yes.txt > y # sending results to the same file result in a 0 length file.
# $ mv y yes.txt 
# $ echo "n" >> yes.txt
# $ wc -l yes.txt
# 10000 yes.txt

./are_you_sure.sh < yes.txt &> output.txt

cat output.txt
rm -f output.txt

./are_you_sure.sh < yes.txt 
