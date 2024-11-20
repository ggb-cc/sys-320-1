#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

# TODO - 1
# Make a function that displays all the courses in given location
# function dislaplays course code, course name, course days, time, instructor
# Add function to the menu
# Example input: JOYC 310
# Example output: See the screenshots in canvas

function getByLocation (){

echo -n "Enter a location: "
read userInput2
echo ""

cat "${courseFile}" | grep "$userInput2" | cut -d';' -f1,2,5,6,7 | \
sed 's/;/ | /g'

}


# TODO - 2
# Make a function that displays all the courses that has availability
# (seat number will be more than 0) for the given course code
# Add function to the menu
# Example input: SEC
# Example output: See the screenshots in canvas

function getByAvailability () {

echo -n "Enter a course code: "
read userInput3
echo ""



cat "${courseFile}" | while read -r line
do


code=$(echo "$line" | cut -d' ' -f1)

if [[ "$code" == "$userInput3" ]]; then


openSeats=$(echo "$line" | cut -d';' -f4)


if (( $openSeats > 0 )); then



	echo "$line" | cut -d';' -f1,2,3,4,5,6,7 | \
sed 's/;/ | /g'

fi


fi




done










}





while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display courses by room name"
	echo "[4] Display course by availability"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		getByLocation

	elif [[ "$userInput" == "4" ]]; then
		 getByAvailability

	# TODO - 3 Display a message, if an invalid input is given
	fi
done
