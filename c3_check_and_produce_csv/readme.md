# Time zones
What is UTC and +0300. What are time zone in programming.

## Get the log in local time

> git log --date=local

# Check homeworks for quadratic equation
## Check homeworks and write in csv

```ruby
require 'csv'

Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
	result= `ruby #{filename} 1 3 2`
	CSV.open("result.csv","w") do |csv|
		solved = 0
		if result=="-2.0,-1.0\n"
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end
end
```

## Open the file in append mode

```ruby
CSV.open("result.csv","a")
```

## Sort the file in ascending order by class

```ruby
my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[0] <=> b[0] }
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end
```

## Strip the result when comparing

```ruby
solved = 0
if result.strip=="-2.0,-1.0"
	solved = 1
end
```

## Sort the file in ascending order by class and number

```ruby
my_csv.sort! do |a, b| 
	(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end
```

# Homework

## Fix quadratic equations
Fix all the quadratic equations so they return a correct result

## Checkout to a date in github
How to checkout to a specific date in github

## Write a script for checking homeworks for counting words.

1. Using the script for checking the quadratic equations implement a similar script for checking the homeworks for quadratic equations
2. Submit the script in folder c3_check_and_produce_csv/check_counting_words
3. The file must be named Class_Number_FirstName_LastName.rb
4. The program should be run as 

> ruby Class_Number_FirstName_LastName.rb folderWithCountWordsPrograms

and should produce a result.csv file in the folder

This are the things that should be changed in the already existing program

```ruby
result= `ruby #{filename} YOU SHOULD CHANGE HOW THE PROGRAM FOR COUNTING WORDS IS EXECUTED`
```

```ruby
solved = 0
if result=="THIS SHOULD BE YOUR NEW EXPECTED RESULT"
	solved = 1
end

###Deadline 2015-10-07 22:00
```
