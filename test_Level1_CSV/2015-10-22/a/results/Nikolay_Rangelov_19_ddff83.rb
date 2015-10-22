require 'csv'

path_one = ARGV[0]
path_two = ARGV[1]
len = 0
checked_files = []
CSV.open("result.csv", "w") do |csv|
	Dir.glob(path_one + "*") do |filename_one|
		splited = filename_one.split("/").last
		just_name = splited.split(".").first
		if just_name.size == 7
			len = ((splited.size-1)/2).floor2(0);
			csv << [splited, len]
			checked_files << [splited, len]
		end
		len = 0
	end

	Dir.glob(path_two + "*") do |filename_one|
		splited = filename_one.split("/").last
		just_name = splited.split(".").first
		if just_name.size == 7
			len = ((splited.size-1)/2).floor2(0);
			csv << [splited, len]
			if checked_files.include?(splited,len)
				#do nothing
			else
				csv << [splited, len]
			end
		end
		len = 0
	end
end


my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[0].downcase <=> b[0].downcase }
my_csv.reverse!
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end