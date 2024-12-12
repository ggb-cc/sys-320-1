#! /bin/bash

link="http://10.0.17.6/Assignment.html"

rawPage=$(curl -sL "$link")

:> rawPage.txt

echo "${rawPage}" > rawPage.txt

tableOneContents=$(cat rawPage.txt | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table[1]" | \
grep "<td>" | \
sed 's/<td>//g' | \
sed 's/<\/td>&#13;//g')


tableTwoContents=$(cat rawPage.txt | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --copy-of \
"//html//body//table[2]" | \
grep "<td>" | \
sed -n '2~2!p' | \
sed 's/<td>//g' | \
sed 's/<\/td>&#13;//g')


numLines=$(echo "$tableTwoContents" | wc --lines)

#echo  "$tableTwoContents"

for ((i = 1 ; i <= numLines ; i ++)); do

echo $(echo "${tableTwoContents}" | head -n ${i} | tail -n 1) \
$(echo "${tableOneContents}" | sed -n '2~2!p' | head -n ${i} | tail -n 1) \
$(echo "${tableOneContents}" | sed -n '1~2!p' | head -n ${i} | tail -n 1)



done





