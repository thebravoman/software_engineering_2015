# Check the quadratic equations with a script and continue to checking the scripts for counting words

## Git usage commands
Here are some of the new and usefull commands for using git

### Check before a certain date
git log --before="2015-10-07 22:00"

### Check log on specific file
git log a2_check.rb

### Check change on specific file
git log -p a2_check.rb

# Improve of the script from class 3 so that it could work for all cases. 
The new version of the files is directly commited to the folder of the c3 files

## Stack trace for a mistake

```ruby
a2_check.rb:6:in `block (2 levels) in <main>`: undefined method `split` for nil:NilClass (NoMethodError)
	from a2_check.rb:4:in `each`
	from a2_check.rb:4:in `block in <main>`
	from /home/kireto/.rvm/rubies/ruby-2.1.1/lib/ruby/2.1.0/csv.rb:1268:in `open`
	from a2_check.rb:3:in `<main>`
```

## Check for the file format
The files in the folder could be named in different ways. We should process only the files that are in the required name format
```ruby
	name = filename.split("/").last.split("_")
	if name.size == 4
	 ..
	end
```

## Remove duplicates from the result.csv
There are files with extension .rb~ in the folder. Remove duplicates so that only one person appears in the csv.

```ruby
checked_files = []
..
if name.size == 4 && !checked_files.include?(name[2]+name[3])
..
checked_files << name[2]+name[3]
```

```ruby
if name.size == 4
			clazz = name[0]
			number = name[1]
			first_name = name[2]
			last_name = name[3].split(".").first
			
			if !checked_files.include?(first_name+last_name)
				p "#{clazz},#{number},#{first_name},#{last_name}"
				result= `ruby #{filename} 1 3 2`
				checked_files << first_name+last_name
				solved = 0
				if result.strip=="-2.0,-1.0"
					solved = 1
				end
				csv_array << [clazz,number,first_name,last_name,solved]
			end
		end
```

# Homework

## Version 2 of Counting Words

Improve counting words program to take punctuation marks into account.
The text that we count the words in may contain punctuation marks like ",",".","!","?" or any other mark.
The script that counts the word in the file must take this into account and also count all the puctuation marks.
As a result the script should produce the following output:

> first_word,7

> second_word,3

> n_work,1

> "marks", sum(N)

The last line of the output must contain the word "marks", followed by a number. The number is the sum of all the occurences of the puctuation marks. If there are no puctuation marks this line should be skipped.


### Submit
As a new version of the previous program for counting words.

### Deadline
2015-10-12 22:00
