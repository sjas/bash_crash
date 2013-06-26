#/bin/bash

# Note that execute permissions will never be given on files by default.
# It will, however, be given to directories. See below.
echo -n "Doing 0000:" && umask 0000 && touch a && ls -l a && rm ./a
echo -n "Doing 0001:" && umask 0001 && touch a && ls -l a && rm ./a
echo -n "Doing 0002:" && umask 0002 && touch a && ls -l a && rm ./a
echo -n "Doing 0003:" && umask 0003 && touch a && ls -l a && rm ./a
echo -n "Doing 0004:" && umask 0004 && touch a && ls -l a && rm ./a
echo -n "Doing 0022:" && umask 0022 && touch a && ls -l a && rm ./a
echo -n "Doing 0422:" && umask 0422 && touch a && ls -l a && rm ./a

# ls -ld shows directory permissions. ls -l shows directory contents.
echo -n "Doing 0001 on a directory:" && umask 0001 && mkdir a && ls -l a && ls -ld a && rm -rf ./a
echo -n "Doing 0002 on a directory:" && umask 0002 && mkdir a && ls -l a && ls -ld a && rm -rf ./a
echo -n "Doing 0004 on a directory:" && umask 0004 && mkdir a && ls -l a && ls -ld a && rm -rf ./a
echo -n "Doing 0045 on a directory:" && umask 0045 && mkdir a && ls -l a && ls -ld a && rm -rf ./a

echo "Current script $0, last command error code: $?, current pid: $$"

echo -n "Doing 1002:" && umask 1002 && touch a && ls -l a && rm ./a

echo "Current script $0, last command error code: $?, current pid: $$"
echo 'Current script $0, last command error code: $?, current pid: $$' # single quotes are for literals.

echo "We're running this script on `date`"  # Back quotes execute commands inside of an echo statement
echo -n "We're running this script on " && date

echo 'We'\''re running this script on `date`' # Notice how the ' in We're is escaped.
