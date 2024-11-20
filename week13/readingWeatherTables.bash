#! /bin/bash

link="http://10.0.17.6/Assignment.html"

rawPage=$(curl -sL "$link")

:> rawPage.txt

echo "${rawPage}" > rawPage.txt

t1=$(awk ' /<td>|<br>/ {print}' rawPage.txt)

echo "$t1"


