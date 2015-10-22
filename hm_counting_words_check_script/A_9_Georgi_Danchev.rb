require 'csv'

File.open( "test.txt","w" ) do |file|
    file.puts "Unicorn uni corn corn uni"
end

CSV.open("result.csv","w") do |csv|
    Dir.glob(ARGV[0]+"*").each do |filename|
        name = filename.split("/").last.split("_")
        result= `ruby #{filename} test.txt`.delete("\n").downcase

        solved = 0

        if result == "uni,2corn,2unicorn,1"
            solved = 1
        else
            p result
        end

        csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| [a[0], a[1].to_i] <=> [b[0], b[1].to_i] }
CSV.open("result.csv", "w") do |csv|
    my_csv.each do |element|
        csv << element
    end
end