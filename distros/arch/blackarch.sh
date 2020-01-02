#!/bin/bash
# Just tested - working fine so far.

# update

pacman -Syyu

curl -O https://blackarch.org/strap.sh

sh="$(sha1sum strap.sh)"

echo "Does $sh equal 9f770789df3b7803105e5fbc19212889674cd503 ?"

read ent

if [ ! $(echo $ent | grep -c y ) ] ; then
	echo bye
	exit 1
fi

chmod +x strap.sh

./strap.sh

echo Finished

