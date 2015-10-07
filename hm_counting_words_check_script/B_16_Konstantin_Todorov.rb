require 'csv'
	CSV.open("resultat.csv","w") do |csv|
    Dir.glob(ARGV[0]+"*").each do |filename|
    name = filename.split("/").last.split("_")
    p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
    result= `ruby #{filename} test.txt`
    
        solved = 0
        if result=="hello,2\npeople,1\nworld,1\n"
            solved = 1
        end
        csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
end


my_csv = CSV.read 'resultat.csv'
my_csv.sort! { |a,b| (a[0] == b[0]) ? (a[1] <=> b[1]) : (a[0] <=> b[0]) }
CSV.open("resultat.csv", "w") do |csv|
        my_csv.each {|element| csv << element}
end
