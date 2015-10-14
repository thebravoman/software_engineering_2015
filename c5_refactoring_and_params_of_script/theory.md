#Refactoring
Improving the structure and design of existing code without changing its behaviour

## Extract method
Extract behaviours into methods from a2_check.

 - sort_result
 - is_file_checked - extract methods
 - is student checked - rename methods
 - student_checked
 - add question mark because of convention
 - solved? expected, result -> because of extacting of behaviour
 - get_names
 - valid_names?
 - remove_file_ext

## Make the program work for both homeworks - quadratic and count words

This is how it should be executed for quadratic

> ruby a2_check.rb ../hm_quadratic_equation/ 1 4 2 -3.414213562373095,-0.5857864376269049

This is how it should be executed for count_words

> ruby a2_check.rb ../hm_count_words/ file.txt a,1dd,2

# Homeworks

# CSV files
You are given a CSV file with information about different purchases on different dates for different sums. The format is the following:

|Item |Date | Cost |
|-----|-----|-------|
|Item1|Date1| Cost1 |
|Item2|Date2| Cost2 |

Items, Dates and costs are not sorted in any particular order
Date is in the format YYYY-MM-DD (2015-10-14)

Implement a program that processes the file and produces a file called result.csv.
The program has the following usage:

> ruby my_program [COMMAND] [OPTIONS]

The different COMMANDS and OPTIONS are

## sort column_number order
Sorts the file by the given colum in the given order.

 - column_number is zero based
 - order is ASC or DESC

> ruby my_program.rb sort 0 ASC

should sort the file by first column in ascending order

## filter_cost min_value max_value
The result file contains only the rows where 
min_value <= cost <= max_value

The result file is sorted by cost ASC.

> ruby my_program.rb filter_costs 10 100

This would produce a CSV file only with the lines from the original that have a cost between 10 and 100

## Deadline 
Submit the program in folder hm_csv_process no later than 2015-10-19 22:00

## Exam
This or veryyyyy similar task will be on the EXAM..

## Where to start

### Reading CSV and sorting it
Start from how do you read CSV. Check out https://github.com/thebravoman/software_engineering_2015/blob/master/c3_check_and_produce_csv/a2_check.rb
and specifically this code:

```ruby
def sort_result
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i] }
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
end
```
### Processing command line arguments
https://github.com/thebravoman/software_engineering_2015/blob/master/c3_check_and_produce_csv/a2_check.rb
User the ARGV array as

```ruby
 ARGV[0]
```

### Writing CSV files
https://github.com/thebravoman/software_engineering_2015/blob/master/c3_check_and_produce_csv/a2_check.rb

```ruby
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end
```




