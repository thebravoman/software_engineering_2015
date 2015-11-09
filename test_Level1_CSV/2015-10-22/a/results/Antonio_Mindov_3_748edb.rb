require 'csv'

f1 = []

Dir.glob(ARGV[0] + "*") do |filename|
	splited = filename.split("/").last.split("_")
	last = splited[1]
	name = splited[0].to_s + splited[1].to_s

	if(last.length == 5)
		f1 << name
	end
end

written = []

CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[1] + "*") do |filename|
		splited = filename.split("/").last.split("_")
		last = splited[1]
		name = splited[0].to_s + splited[1].to_s

		if(last.length == 5)
			if(f1.include?(name))
				if(!written.include?(name))
					written << name;
					csv << [splited[1],splited[0]]
				end
			end
		end
	end
end

def sort_result
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| a[0].downcase <=> b[0].downcase }
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
end

sort_result