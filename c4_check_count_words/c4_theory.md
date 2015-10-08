
## Check before a certain date
git log --before="2015-10-07 22:00"

## Check log on specific file
git log a2_check.rb

## Check change on specific file
git log -p a2_check.rb

# Improve of the script from class 3 so that it could work for all cases. The new version is commited in c3

## Stack trace for a mistake
a2_check.rb:6:in `block (2 levels) in <main>`: undefined method `split` for nil:NilClass (NoMethodError)
	from a2_check.rb:4:in `each`
	from a2_check.rb:4:in `block in <main>`
	from /home/kireto/.rvm/rubies/ruby-2.1.1/lib/ruby/2.1.0/csv.rb:1268:in `open`
	from a2_check.rb:3:in `<main>`

## Check for the file format
```ruby
	name = filename.split("/").last.split("_")
	if name.size == 4
	 ..
	end
```

## Remove duplicates from the result.csv

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








