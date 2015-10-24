=begin
Develop a program named FirstName_LastName_ClassNumber_8f95be.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that have only letters from a-z or A-Z in
 their names excluding extension. 
 If there are duplicates the file must be written only once.;
3. Calculate the length of their names (including extensions) divided by 2.;
4. Sort the result by length DESC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require 'csv'

def all_letters(str)
    # Use 'str[/[a-zA-Z]*/] == str' to let all_letters
    # yield true for the empty string
    str[/[a-zA-Z]+/]  == str
end

folder2_arr = []
checked = []
letters = []

CSV.open("result.csv", "w") do |csv|
Dir.glob(ARGV[1]+"*").each do |filename|
  name = filename.split("/").last.split("_")
  if(name.size == 3 and (name[0].all_letters and name[1].all_letters))
    first_name = name[0]
    last_name =  name[1].split(".").first
    folder2_arr << [last_name, first_name]
	letters << (first_name.length + last_name.length)/2
	checked << last_name + first_name
  end
end

Dir.glob(ARGV[0]+"*").each do |filename|
  name = filename.split("/").last.split("_")
  if(name.size == 3 and (all_letters(first_name) and all_letters(last_name)))
    first_name = name[0]
    last_name = name[1].split(".").first
    csv << [last_name, first_name]  if !checked.include? (last_name + first_name) 
  end
end
end

my_csv = my_csv.sort_by {|a, b| [-b.to_i, a]}
CSV.open("result.csv", "w") do |csv_arr|
  my_csv.each {|element| csv_arr << element}
end
