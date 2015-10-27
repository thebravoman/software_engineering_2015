require 'csv'

#folder1 = ARGV[0]
#folder2 = ARGV[1]

CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
    name = filename.split("/").last
    test= name.size.split("_")
    if name.size !=3
    lenght = name.size
      csv << [name, name.lenght]
    end
  end
 end
CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[1] + "*").each do |filename|
    name = filename.split("/").last
    test = name.split("_")

    if test.size != 3
    lenght = name.size
    csv << [name, name.lenght]
     end
    end
 end
my_csv = CSV.read 'result.csv'

my_csv.uniq
my_csv.sort! {|a, b| a[1] <=> b[1]}

my_csv.sort_by{|name,length| name.downcase}
CSV.open("result.csv", "w") do |csv_array|
	my_csv.each do |row|
		csv_array << row 
		end
	end

