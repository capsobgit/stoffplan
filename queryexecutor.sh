#!/bin/bash
# In diesem Skript wird aus den Argumenten 
# die eigentliche query gebildet und an filemaker.sh
# weitergeleitet
# 19.02.2018

login='mysql -N -u stoffplan -e' 
sql='select link from stoff'
database='stoffverteilungsplan'
query=""

if [ -n "$1" ]
then
	query="where kategorie = (select kuerzel from kategorien where bezeichnung ='$1')"	
fi

if [ -n "$2" ]
then	
	query="$query and unter_kategorie = '$2'"	
fi
query="$query and stufeVon between $3 and $4 and stufeBis between $3 and $4"

result=$(mysql -N -u stoffplan -e "select link from stoff $query order by group_id, link" $database)
#heftNr=$(mysql -N -u stoffplan -e "select group_id from stoff $query order by group_id, link" $database)
#echo $query
#sleep 14
./filemaker.sh $result &
exit
