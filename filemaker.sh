#!/bin/bash

ordner=/tmp/tempOrdner
rm -r $ordner
mkdir $ordner

for i in $*
do
	#ln -s $i $ordner
	cp $i $ordner
done

nautilus $ordner
