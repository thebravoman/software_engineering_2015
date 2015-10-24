=begin 
Develop a program named FirstName_LastName_ClassNumber_8cf947.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name DESC;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN

=end

require 'csv'

def write_csv arr1,arr2

	exist = false
	array = []

	puts arr1
	puts arr2

	arr1.each do |file1|
		exist = false
		arr2.each do |file2|
			if (file1[0] == file2[0]) && (file1[1] == file2[1])
				exist = true
			end

			
		end

		if (exist == false)
			array << file1
			end
	
	end

	array.sort!{|a,b| a[0] <=> b[0]}

	CSV.open("result.csv","w") do |csv_array|
		array.each do |line|
			csv_array << line
		end
	end
end#end of write_csv

in0 = ARGV[0]
in1 = ARGV[1]

arr = []
Dir.glob(ARGV[0] + "*").each do |filename1|
	name1 = filename1.split("/").last.split("_")
	arr << [name1[1],name1[0]]
end

arr2 = []
Dir.glob(ARGV[1] + "*").each do |filename2|
	name2 = filename2.split("/").last.split("_")
	arr2 << [name2[1],name2[0]]
end

write_csv arr,arr2