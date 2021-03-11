#!/bin/zsh
clear
sha512sum -c *.sha512
echo "Press ENTER to Exit"
while [ true ] ; do
read -t 30 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "Waiting to press ENTER..."
fi
done

