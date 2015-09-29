# Class excersize
Implement a program for automatically checking the programs from class1 homeworks and if they work correctly

## Travers directory
List all the files in the current directory

```ruby
Dir.glob("*").each do |file|
	p file
end
```

## Split file name
Process the files from class1 homework and outputs the Class,Number,FirstName,LastName of each students

```ruby
Dir.glob(ARGV[0]+"*").each do |file|
	result = file.split("/").last.split("_")
	p "#{result[0]},#{result[1]},#{result[2]},#{result[3]].split(".").first}"
end
```

**Note**: Regex are better solution, but it is still early in the course.

# check homeworks
Execute a program as a ruby program by passing parameters 1 3 2. The solution of the quadratic equation with this params should be -1,-2

```ruby
Dir.glob(ARGV[0]+"*").each do |file|
	result = file.split("/").last.split("_")
	p "#{result[0]},#{result[1]},#{result[2]},#{result[3].split(".").first}"
	p `ruby #{file} 1 3 2`
end
```

# Homeworks

## Task 1
1. Improve the class1_hm programs to output in the correct format. 

* Solutions to the quadratic equation should be on the same line separated with comma, ordered in ASCENDING order:
> x1,x2

* If there is only one solution the output should be:
> x1

* If there are not solutions then no value should be printed at the standard output:

### Submit 
Commit a new version to the old program.

### Deadline
2015-30-09 22:00

## Task 2
2. Create a program for counting words in a text file. Use method split. The name of the file is passed as first command line argument.

The program is run as:
> ruby my_program file.txt

At the standard output the output should be:

> first_word,7
> second_word,3
> ...
> n_work,1

Output should be sorted by the number of word occasions DESCENDING.
If there are two words with the same number of occasions they should be sorted ASCENDING.

### Submit
A file called Class_Number_FirstName_LastName in folder count_words

### Deadline
2015-10-05 20:00

