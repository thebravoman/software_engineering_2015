=begin 
Develop a program named FirstName_LastName_ClassNumber_33427b.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 5 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN

=end

require 'csv'

CSV.open("result.csv","w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
  name = filename.split("/").last.split("_")
    if name.length==3
	if name[1].length==5
	  csv << [name[0],name[1].split(".").first]
        end
    end
  end
end

my_csv = CSV.read 'result.csv'

my_csv.sort! do |a, b|
  (a[1] == b[1]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end

CSV.open("result.csv","w") do |csv_array|
  my_csv.each do |row|
    csv_array << row
  end
end

