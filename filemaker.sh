#!/bin/bash
# Script zur Erstellung eines Ordners
# in /tmp. Dieser dient zur Anzeige 
# der aktuellen query und wird bei
# jeder Anfrage ne angelegt
# 19.02.2018

ordner=/tmp/tempOrdner
rm -r $ordner
mkdir $ordner

for i in $*
do
	#ln -s $i $ordner
	cp $i $ordner
done

nautilus $ordner
