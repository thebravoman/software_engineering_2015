require 'csv'
File.new("the_sentence.txt", "w")
File.open("the_sentence.txt", 'r+') {|file| 
file.write("Using the script for checking the quadratic equations implement a similar script for checking the homeworks for quadratic equations") }
CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
    	name = filename.split("/").last.split("_")
    	p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
    	result= `ruby #{filename} the_sentence.txt`
       	 solved = 0
        if result == "for,3\nthe,3\nchecking,2\nequations,2\nquadratic,2\nscript,2\na,1\nhomeworks,1\nimplement,1\nsimilar,1\nusing,1\n"
            solved = 1
        end
        csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
end

my_csv = CSV.read 'result.csv'

my_csv.sort! { |a,b| (a[0] == b[0]) ? (a[1] <=> b[1]) : (a[0] <=> b[0]) }

CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
end
