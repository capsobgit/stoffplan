#!/bin/bash

stufeVon=""
stufeBis=""
kategorie=""
unter_kategorie=""


os=$(dialog --menu "Betriebssystem wählen" 0 0 0 \
	"Linux" "" "BSD" "" "Solaris" "")
dialog --clear
dialog --yesno "Bestätigen Sie Ihre Auswahl: $os" 0 0
dialog --clear
clear

echo Bye

