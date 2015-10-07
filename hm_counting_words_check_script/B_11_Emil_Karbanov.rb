require 'csv'
	File.new("test.txt", "w")
	File.open("test.txt", 'r+') {|f| f.write("how much wood wood a woodchuck chuck if a woodchuck could chuck wood") }
    CSV.open("result.csv","a") do |csv|
    Dir.glob(ARGV[0]+"*").each do |filename|
    name = filename.split("/").last.split("_")
    p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
    result= `ruby #{filename} test.txt`
    
        solved = 0
        if result=="wood,3\na,2\nwoodchuck,2\nchuck,2\nhow,1\nmuch,1\nif,1\ncould,1\n"
            solved = 1
        end
        csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
end
my_csv = CSV.read 'result.csv'
my_csv.sort! do |a, b| 
    (a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end
