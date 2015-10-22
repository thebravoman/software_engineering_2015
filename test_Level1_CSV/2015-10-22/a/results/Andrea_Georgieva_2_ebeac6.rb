require 'csv'


path1 = ARGV[0]
path2 = ARGV[1]


CSV.open("result.csv", "w") do |csv|
  Dir.glob(path + "*") do |filename|
    splited = filename.split("/").last.split("_")
    if splited.size == 3
      if splited.last.split(".").last == "rb"
        first_name1 = splited[0];
        last_name1 = splited[1];
      end
    end 
  end

  Dir.glob(path + "*") do |filename|
    splited = filename.split("/").last.split("_")
    if splited.size == 3
      if splited.last.split(".").last == "rb"
        first_name2 = splited[0];
        last_name2 = splited[1];
      end
    end 
  end
  
  if first_name1 <> first_name2 && last_name1 <> last_name2
     csv << [splited[0], splited[1]]
  end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[1].downcase <=> b[1].downcase }
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end