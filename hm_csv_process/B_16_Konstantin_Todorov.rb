require 'csv'

file = ARGV[0]
command = ARGV[1]
column = ARGV[2]
option = ARGV[3]
min = ARGV[3]
max = ARGV[4]
my_file = CSV.read file

def sorting_ASC my_file, column
    if column == "1" 
        my_file.sort{|a,b| [a[0].to_s] <=> [b[0].to_s]}
    end
    if column == "2"
        my_file.sort{|a,b| [a[1].to_i] <=> [b[1].to_i]}
    end
    if column == "3"
        my_file.sort{|a,b| [a[2].to_i] <=> [b[2].to_i]}
    end
CSV.open("result.csv", "wb") do |result|
    my_file.each {|cell| result << cell}
end
end 

def sorting_DESC my_file, column
    if column == "1" 
        my_file.sort{|a,b| [a[0].to_s] <=> [b[0].to_s]}.reverse!
    end
    if column == "2"
        my_file.sort{|a,b| [a[1].to_i] <=> [b[1].to_i]}.reverse!
    end
    if column == "3"
        my_file.sort{|a,b| [a[2].to_i] <=> [b[2].to_i]}.reverse!
    end
CSV.open("result.csv", "wb") do |result|
    my_file.each {|cell| result << cell}
end
end 

def filter_cost my_file, min, max
	CSV.open("result.csv", "w") do |csv|
    my_file.each do |a|
      csv << a if (a[2].to_i >= min) && (a[2].to_i <= max)
    end
end
end

if command == "sort" && option == "ASC"
    sorting_ASC my_file, column
elsif  command == "sort" && option == "DESC"
    sorting_DESC my_file, column
else command == "filter_cost"
	filter_cost my_file, min, max
end

    
