require 'csv'

FILE.new('file.txt', "w")
FILE.open('file.txt', "w") {|file|
file.puts "He shoots and he scores, scores, scores and scores"
}

CSV.open("result.csv", "w") do |csv|
Dir.glob(ARGV[0]+"+").each do |filename|

 name = filename.split("/").last.split("_")
 p "#{name[0]}, #{name[1]}, #{name[2]}, #{name[3].split    (".").first}"
 result = 'ruby #{filename} file.txt'
 solved = 0

 if result.strip == "he,2\nshoots,1\nand,2\nscores,4\n"
    solved = 1
 end
 
 csv << [name[0], name[1], name[2], name[3].split(".").first, solved]
 end
end

  my_csv = CSV.read 'result.csv'
  my_csv.sort! { |a,b| [a[0], a[1]to_i] <=> [b[0], b[1].to_i}]
  CSV.open("result.csv", "w") do |csv|
  my_csv.each do |row|
  csv << row
end 
end
