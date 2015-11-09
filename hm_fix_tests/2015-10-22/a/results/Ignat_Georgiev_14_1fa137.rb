require 'csv'
CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		
		name = filename.split("/").last
		test= name.split("_")
		if test.size !=3
		length=name.size
		csv << [name,name.length ]
		end
	end	
end
CSV.open("result.csv","w") do |csv|
Dir.glob(ARGV[1]+"*").each do |filename|
		
		name = filename.split("/").last
		test= name.split("_")
		if test.size !=3
		length=name.size
		csv << [name,name.length ]
		end
	end	
end
my_csv = CSV.read 'result.csv'

my_csv.uniq
my_csv.sort! { |a, b| b[1] <=> a[1] }
my_csv.reverse!
my_csv.sort_by{|name,length| name.downcase}
CSV.open("result.csv","w") do |csv_array|
	my_csv.each do |row|
		csv_array << row
	end
end
=begin
Develop a program named FirstName_LastName_ClassNumber_1fa137.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digit.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by length DESC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

