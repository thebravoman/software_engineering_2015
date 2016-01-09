This is the description of this homework and its versions

# Version 1 - V1
Count the words in a file

# Version 2 - V2
Count the words and symbols in a file

# Version 3 - V3
Count the words and symbols in a file and generate CSV, XML, JSON

# Version 4 - V4
Count the words and symbols in a Ruby file and generate CSV, XML, JSON

# Version 5 - V5
Count the words and symbols in a ruby file and generate CSV, XML, JSON, but accept an url as an input and remove all html meta from the url contents

# Version 6 - V6
Count the words and symbols in a ruby file and generate CSV, XML, JSON, but accept an url as an input and remove all html meta from the url contents. 
Generate a SVG with a graphic showing the distribution with bars

# Version 7 - V7
Add an option to V6 to pass a folder as an argument.

Arguments:
	-d - if there is this option the argument is a folder and should be traversed recursively to find all the files in this folder and count the words in this file.

Example:
	ruby program.rb -d the_folder_to_traverse_recursively

# Version 8 - V8
Use a database to store the gathered information.

# Project for at least 3M lines of code

Use the counting words programs to count the words in at least 3 Million lines of code. More lines are ok.
Find out what is the distribution of each word and what is the name of the most used words in each of the languages

## Line distribution
 - >= 1 million - Ruby
 - >= 1 million - Java
 - >= 1 million - C++

## Parsing tools
You could use 
 - AST parsers
 - Regular expressions
 - anything else you could think of or find appropriate
 
## Language
The program could be implemented in language of your choice although Ruby is the preferred for this project.

## Code
The code for parsing could be retrieved from github.com, eclipse.org, apache.org the GNU project and linux project repositories or any other public repository.

## Result in JSON format
The result should be in the following JSON format.
{
  "word1" : number_of_occurrences,
  "word2" : number_of_occurrences,
  ...
  "wordN" : number_of_occurrences,
  "marks" : number_of_marks_in_the_file
}

The result should be sorted by number_of_occurences in DESC. If number of occurrences is equal for two words they should be sorted in ASC
The last row is the number of marks found. "mark" is everything that is not a word.

Example 

{
  "word2" : 5,
  "word1" : 4,
  "wordN" : 4
}
	
Three files should be present. One for Ruby, Java and C++.

## SVG graphic. 
The first bar, for the world with most occurrences should be 500 pixels height and on the left. The others should be proportionally smaller. The smaller bar should be 1 pixel.

## What is a "word"

A word in all the three languages is a:
	- variable
	- class
	- method
	- keyword
	- literal 
	- enum
	- and also any other combination of symbols that follow the rules for identifier in the given language
	- is not a digit in binary, decimal or hex format

Examples for words:
 - i is a word understood as i
 - MyAbstractClass is one word understood as myabstractclass
 - method_1 is one word understood as method_1
 - public static void getString(int param1, int param2) contains the words public, static, void, getString, int, param1, param2 and two special symbols which are ( )
 - for(int i=0;i<10;i++) contains the words for, int, i and the symbols ( = ; < ; + )
 - array.each { |var| var.somemethod } contains the words array, each, var, somemethod and the symbols { | . }
 - db_name = "test_db" contains the words db_name, test_db and the symbols = "

A mark is everything that is not a word where word is defined above.

## Final result
As a final result from the project you should have the following files:
 - ruby.json - words in the ruby repositories
 - ruby.svg - svg file representing the distribution in the ruby files
 - cpp.json - words in the cpp repositories
 - cpp.svg  - svg file representing the distribution in the cpp files
 - java.json - words in the java repositories
 - java.svg  - svg file representing the distribution in the java files
 - repositoires.csv - a csv document with a link to the repositories parsed in the following project and the number of lines in the parsed files in this repository. The file should be sorted by "words" in DESC order
			repo1, words
			repo2, words

## Deadline 
11 Jan 22:00 
Should be presented on 12 Jan in class

## Commit 
The 7 files should be commited in folder hm_3_millions_lines/Class_Number_FirstName_LastName where Class,Number,FirstName,LastName are values for each student.
