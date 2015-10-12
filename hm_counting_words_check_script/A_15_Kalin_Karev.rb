require 'csv'
require 'fileutils'

Dir.chdir "#{ARGV[0]}"

File.open("task.txt", 'w+') {|f| f.write("How are you? Would you like to have a coffee?") }

Dir.glob("*.rb").each do |filename|
    name = filename.split("/").last.split("_")
    p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
    q = "ruby #{filename} task.txt"
    answer = `#{q}`

    CSV.open("answer.csv","a") do |csv|
			solved = 0
        if answer.strip.downcase == "you,2\na,1\nare,1\ncoffee,1\nhave,1\nhow,1\nlike,1\nto,1\nwould,1"
            solved = 1
        end
        csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
end

my_csv = CSV.read 'answer.csv'
my_csv.sort! do |a, b| 
    (a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end
CSV.open("answer.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
end
