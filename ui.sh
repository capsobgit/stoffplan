#!/bin/bash
# UI fuer den Stoffverteilungsplan
# liest von der shell Benutzereingaben, welche weiterverarbeitet werden
# Das Ergebnis dient als argument für queryexcutor-skript

stufeVon=""
stufeBis=""
kategorie=""
unter_kategorie=""
ueberschrift=""

#Ueberpruefung ob toilet installiert ist
if hash toilet 2>/dev/null
then
	ueberschrift=$(toilet -w 150 --metal 'Stoffplan') 
    else
	ueberschrift="*** Stoffplan ***"
fi
clear
echo "$ueberschrift"
echo

#Auswahl-Menu
optionen='Suchen Einfuegen Beenden'
PS3='Bitte waehlen: '
select wahl in $optionen
do
if [ $wahl == 'Beenden' ]
then
break
elif [ $wahl == 'Suchen' ]
then
	clear
	echo "$ueberschrift"
	echo
#Menu Stufenabfrage ab	
	stufe='5 6 7 8 9 10'
	PS3='Ab welcher Klassenstufe?: '
	select stufenwahl in $stufe
	do
		if [ !-n $stufenwahl ]
		then 
			echo 'Bitte 5-10 Klasse'
			continue
		fi
		stufeVon=$stufenwahl
		clear
		echo "$ueberschrift"
		echo
		break
	done
#Menu Stufenabfrage bis
	PS3='Bis zu welcher Klassenstufe?: '
	# Es muss nur noch stufeBis >= stufeVon abgefragt werden
	counter=$stufeVon
	unset stufe
	stufe=''
	while [ $counter -le 10 ]
	do
		stufe="$stufe $counter"
		((counter++))
	done
        select stufenwahl in $stufe
	do
		if [ !-n $stufenwahl ]
		then 
			echo 'Bitte 5-10 Klasse'
			continue
		fi

		stufeBis=$stufenwahl
		clear
	echo "$ueberschrift"
	echo
		break
	done
#Menu Kategorie
	kat=$(mysql -N -u stoffplan -e 'select bezeichnung from kategorien' stoffverteilungsplan)
	PS3='Welche Kategorie?: '
	select katwahl in $kat
	do
		if [ !-n $katwahl ]
		then 
			echo 'Bitte einer der Kategorien'
			continue
		fi
		kategorie=$katwahl
	        clear	
		echo "$ueberschrift"
		echo
		break
	done
#Menu Unterkategorie
	read -p 'Welche Unterkategorie?: ' unterkat 
		unter_kategorie=$unterkat
		clear
		echo "$ueberschrift"
		echo
	./queryexecutor.sh $kategorie "$unter_kategorie" $stufeVon $stufeBis
	break	
fi
done
clear
echo Bye
#exit


