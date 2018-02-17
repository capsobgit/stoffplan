#!/bin/bash

mysql -N -u stoffplan -e 
"update stoff set link = REPLACE(link, '/home/sobdaro/', ${HOME}/) 
 where link LIKE '%/home/sobdaro/%'"

