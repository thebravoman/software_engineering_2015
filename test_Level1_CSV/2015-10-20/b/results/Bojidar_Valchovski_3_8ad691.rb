require 'csv'

path = ARGV[0]

CSV.open("result.csv",'w') do |csv|
  Dir.glob(path+"*").each do |filename|
	name = filename.split("/").last.split("_")
	if (name[1].length == 5)
	  csv << [name[0],name[1]] 	
	end
  end
end

csv_reader = CSV.read 'result.csv'
csv_reader.sort!{ |a, b| a[1].downcase <=> b[1].downcase}

CSV.open("result.csv","w") do |csv|
  csv_reader.each { |line| csv << line }
end
