require 'csv'
require 'fileutils'

c_directory = Dir.pwd
Dir.chdir "#{ARGV[0]}"

File.open("my.txt", 'w+') {|f| f.write("i I i my Name My name Nik NiK hl") }


Dir.glob("*.rb").each do |filename|
    name = filename.split("/").last.split("_")
    query = "ruby #{filename} my.txt"
    result= `#{query}`
    CSV.open("result.csv","a") do |csv|
        solved = 0
        #puts result
        if result.strip.downcase == "i,3\nmy,2\nname,2\nnik,2\nhl,1"
            solved = 1
        end
        csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! do |a, b| 
    (a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end

CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
end


