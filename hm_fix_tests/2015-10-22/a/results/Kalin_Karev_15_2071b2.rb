require 'csv'
seen = []

CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
    name_no = filename.split("/").last.split(".").first
	name_yes = filename.split("/").last
	num_in_file = name_no.scan(/[0123456789]/).count
	if num_in_file == 7
	  name_length = (name_yes.length/2).floor
	  csv << [name_yes, name_length]
	  seen << name_yes
	end
  end
  
  Dir.glob(ARGV[1]+"*").each do |filename|
    name = filename.split("/").last.split(".").first
	name_no = filename.split("/").last.split(".").first
	name_yes = filename.split("/").last
	num_in_file = name_no.scan(/[0123456789]/).count
	if (num_in_file == 7 && !seen.include?(name_yes))
	  name_length = (name_yes.length/2).floor
	  csv << [name_yes, name_length]
	end
  end
end

my_csv = CSV.read 'result.csv'
my_csv = my_csv.sort_by {|a| a}.reverse
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end
