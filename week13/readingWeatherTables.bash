#! /bin/bash

link="http://10.0.17.6/Assignment.html"

rawPage=$(curl -sL "$link")

:> rawPage.txt

echo "${rawPage}" > rawPage.txt

#awk '$1==/<br>/{f=1} f{print; if ($1==/<td>/) exit}' rawPage.txt | echo


trimedData=$(awk ' /<td>|<br>/ {print}' rawPage.txt | tr -d '\n' ) # | sed 's/\\n/ /g'




echo "$trimedData"





