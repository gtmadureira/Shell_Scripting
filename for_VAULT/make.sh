#!/bin/zsh
clear
echo "Creating Directories..."
mkdir /home/gustavo/Desktop/PENDRIVE
mkdir /home/gustavo/Desktop/DROPBOX
cd /media/veracrypt1/
rm -r topsecret.rar
echo "Compressing 'Top Secret' directory to VeraCrypt volume."
rar a topsecret.rar 'Top Secret'
echo "Enter a password for topsecret.rar in PENDRIVE"
rar a -hp /home/gustavo/Desktop/PENDRIVE/topsecret.rar 'Top Secret'
echo "Enter a password for topsecret.rar in DROPBOX"
rar a -hp /home/gustavo/Desktop/DROPBOX/topsecret.rar 'Top Secret'
cd /home/gustavo/Documents/VAULT/
echo "Dismounting VeraCrypt volume..."
veracrypt -d
echo "Copying files to destinations..."
cp PROTECTED_VAULT /home/gustavo/Desktop/PENDRIVE/PROTECTED_VAULT
cp PROTECTED_VAULT /home/gustavo/Desktop/DROPBOX/PROTECTED_VAULT
cp check.sh /home/gustavo/Desktop/PENDRIVE/check.sh
cp check.sh /home/gustavo/Desktop/DROPBOX/check.sh
echo "Generating signed Hash SHA-512 file for 'PROTECTED_VAULT' at LOCAL"
sha512sum PROTECTED_VAULT | gpg --clearsign --armor > PROTECTED_VAULT.sha512
cp PROTECTED_VAULT.sha512 /home/gustavo/Desktop/PENDRIVE/PROTECTED_VAULT.sha512
cp PROTECTED_VAULT.sha512 /home/gustavo/Desktop/DROPBOX/PROTECTED_VAULT.sha512
cd /home/gustavo/Desktop/PENDRIVE/
echo "Generating signed Hash SHA-512 file for 'topsecret.rar' at PENDRIVE"
sha512sum topsecret.rar | gpg --clearsign --armor > topsecret.rar.sha512
cd /home/gustavo/Desktop/DROPBOX/
echo "Generating signed Hash SHA-512 file for 'topsecret.rar' at DROPBOX"
sha512sum topsecret.rar | gpg --clearsign --armor > topsecret.rar.sha512
cd /home/gustavo/Documents/VAULT/
echo "Press ENTER to Finish and Exit..."
while [ true ] ; do
read -t 30 -n 1
if [ $? = 0 ] ; then
echo "Finished !"
exit ;
else
echo "Waiting to press ENTER to Exit..."
fi
done

