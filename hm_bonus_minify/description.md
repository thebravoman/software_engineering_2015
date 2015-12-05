You have missed participating in some of the homeworks. 
But you know want to make up because you know the subject and would like to learn how to solve the tasks.

This is the chance.
I have always whish to know for which 3 months I have spend the most money. Just input "3" and it to search the whole CSV and to tell me - 
months X,Y,Z are the once you have spend (or gained) the most. So this tasks below are simple steps to this. 

The versions are again six so that you could follow a process while programming them. A real small project. 
It also has requirements that you must first understand before implementing a solution.

The points from this tasks could be added to your overall score without increasing the MAX score for the course.
Currently the max score for the course is 10. This projects could give up to 3.5 more to your score while the course max stays 10. 
It gives a chance to make up for some lost opportunities in the past two and a half months. 

IMPORTANT!
If a previous version does not work than the next one is not checked.

# Bonus tasks 1 Process Monefy csv. 
There is mobile app called Monefy. It is a personal finance management app and it export in the following CSV format

date		account		category	amount		currency	description
01/12/2014	PersonalCash	K		-100		BGN		Some description

You must build 6 versions of a ruby program that:
The submited program is always called Class_Number_FirstName_LastName.rb and should be submited in the folder where this description is

## Version 1 - 
Build a program that accepts:
 - a file name as a first command line argument
 - a date as a second line argument. Date is in format "MM/DD/YYYY"
The program should display on the standard output all the rows from the original file that are for the given date. 
The output should be sorted by "date" ASC

### Points
 0.5

### Deadline
09 Dec 2015 22:00

## Version 2
Build a program that accepts:
 - a file name as a first command line argument
 - a date as a second line argument. Date is in format "MM/DD/YYYY"
 - a value 
The program should display on the standard output:
 - all the rows from the original file that are for the given date and have an amount between (value-10) and (value+10)
The output should be sorted by "date" ASC

### Points
 0.5

### Deadline
10 Dec 2015 22:00

## Version 3
Build a program that accepts:
 - a file name as a first command line argument
 - a string as a second argument. It is not formated as date. And is not a number. And is not "xml"
The program should display on the standard output:
 - all the rows for which second argument is equals to the account column
 - as a final row the sum of the amount value for all the output rows. The sum should be an integer.
The output should be sorted by "date" ASC

### Points 
 0.5
### Deadline
11 Dec 2015 22:00

## Version 4
Build a program that accepts:
 - a file name as a first command line argument
 - a string "xml"
The program should display on the standard output:
 - the original final converted to xml where:
 	- the root node of the xml is called <minify>
	- the root node has many <account> children. The <account> children are sorted ASC
		- the <account> node has <date> children. The <date> children are sorted ASC
			- the <date> node has <amount> children. The <amount> children are sorted ASC
				- the <amount> node contains the value from column "amount" as <amount>-100</amount>

### Points 
0.5 

### Deadline
12 Dec 2015 22:00

## Version 5
Basically version 4, but the program should be able to accept file or url as a command line argument

### Points
0.5

### Deadline
13 Dec 2015 22:00

## Version 6 
Build a program that accepts:
 - a file name as a first command line argument
 - a number - called "months"
The program should display on the standard output:
 - an xml in the format
 <minify>
  <gain> 
    <date_start>the_start_date</date_start>
    <date_end>the_end_date</date_end>
    <value>the_value</value>
  </gain>
  <expense> 
    <date_start>the_start_date</date_start>
    <date_end>the_end_date</date_end>
    <value>the_value</value>
  </expense>
 </minify>

Where the actual values for "the_start_date", "the_end_date", "the_value" are calculated in the following way.
 - For the gain node:
	Which is the period of "months" for which the sum of the possitive "amounts" is the largest. 
	"the_start_date" is the first entry for a month
	"the_end_date" is the last entry for a month.
 - For the expense node:
	Which is the period of "months" for which the sum of the negative "amounts" is the smallest
	"the_start_date" is the first entry for a month
	"the_end_date" is the last entry for a month.

A period of 1 month starts at the smallest date in the month and end at the largest date in the month
A period of 2 months starts at the smallest date in one month and ends at the largest date the next month
A period of 3 months starts at the smallest date in one month and ends at the largest date in the month following the next month.

### Points
1.0

### Deadline
14 Dec 2015 22:00
