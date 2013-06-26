#!/bin/bash

touch perm_test.txt && chmod 444 perm_test.txt

ls -l perm_test.txt

# && allows you to run multiple serial commands: If one command fails, the chain stops there.

# u = user(owner), g = group, o = others, a=all

echo -n "chmod u=rx perm_test.txt:	" && chmod u=rx perm_test.txt && ls -l perm_test.txt && chmod 444 perm_test.txt

echo -n "chmod go-rwx perm_test.txt:	" && chmod go-rwx perm_test.txt && ls -l perm_test.txt && chmod 444 perm_test.txt

echo -n "chmod g+w perm_test.txt:	" && chmod g+w perm_test.txt && ls -l perm_test.txt && chmod 444 perm_test.txt

echo -n "chmod a+x perm_test.txt:	" && chmod a+x perm_test.txt && ls -l perm_test.txt && chmod 444 perm_test.txt

echo -n "chmod g+rx,o+x perm_test.txt:	" && chmod g+rx,o+x perm_test.txt && ls -l perm_test.txt && chmod 444 perm_test.txt

# dot-slash means "current directory"
rm -f ./perm_test.txt

echo $? # return code of last command. Success = 0

ls -l ./perm_test.txt 2>/dev/null

echo $? # This one should have failed with a errno = 2 (file not found) see errno.h : 
# http://www.virtsync.com/c-error-codes-include-errno
