require 'csv'

File.open("text.txt", "w") do |file|
  file.write("Just do It BrO jUsT puT YouR Faith In The Light Have LIGHT in The FAITH Wow")
end

CSV.open("result.csv", "w") do |my_csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
    name = filename.split("/").last.split("_")
    p "#{name[0]},#{name[1]},#{name[2].split(".").first}"#{name[3].split(".").first}"
    result = `ruby #{filename} text.txt`
    solved = 0
    if result.gsub(/\n/,"") == "faith,2in,2just,2light,2the,2bro,1do,1have,1it,1put,1wow,1your,1"
      solved = 1
    end
    print result.gsub(/\n/,"")
    my_csv << [name[0],name[1],name[2].split(".").first,solved] #name[3].split(".").first,solved]
  end
end

csv = CSV.read 'result.csv'
csv.sort! {|a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i]}
CSV.open("result.csv","w") do |result_line|
  csv.each do |row|
    result_line << row
  end
end







