#!/bin/bash

touch perm_test.txt && chmod 444 perm_test.txt

ls -l perm_test.txt

# u = user(owner), g = group, o = others, a=all

params=('u=rx' 'go-rwx' 'g+w' 'a+x' 'g+rx,o+x')

echo "Indices of this list:" ${!params[*]}
echo "Number of parameters:" ${#params[*]}

echo -n "Length of each parameter:" 

upper_bounds=$[${#params[*]}-1] # list goes form 0 to 4

for i in `seq 0 $upper_bounds`; do echo "$i ${#params[i]}"; done # Notice ';' delimiters on single line.

for i in ${params[*]}
do
    echo -n "chmod ${i} perm_test.txt:	" && chmod $i perm_test.txt && ls -l perm_test.txt && chmod 444 perm_test.txt
done

rm -f ./perm_test.txt
