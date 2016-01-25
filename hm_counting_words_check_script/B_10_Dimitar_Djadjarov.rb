require 'csv'
File.new("FILE.txt", "w")
	File.open("FILE.txt", 'r+') {|f| f.write("do do do do do de do do do do do do do do do
mahna mahna
do doo be do do
mahna mahna
do do do do
mahna mahna
do doo de do do de do do de do do de do do doodle do do do doo do !") }
CSV.open("result.csv","a") do |csv|
 Dir.glob(ARGV[0]+"*").each do |filename| 
    name = filename.split("/").last.split("_") 
    p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
    result=`ruby #{filename} MAIKATI.txt`
        solved = 0 
        if result == "do,34\nmahna,6\nde,5\ndoo,3\nbe,1\ndoodle,1\n" 
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
