require 'csv'

folders = [ARGV[0], ARGV[1]]
checked_files = []

CSV.open('result.csv', 'w') do |csv_array|
	Dir.glob(folders[0]+"*").each do |filename|
		name = filename.split('_')
		
		first_name = name[0]
		last_name = name[1]
		digits = name[2].split('.').first
		
		if !checked_files.include?(first_name+last_name)
			checked.files << [first_name+last_name]
				#csv_array << [first_name, last_name, digits]
		end
	end
	Dir.glob(folders[1]+"*").each do |filename|
		name = filename.split('_')
		
		first_name = name[0]
		last_name = name[1]
		digits = name[2].split('.').first
		
		if checked_files.include?(first_name+last_name)
			csv_array << [first_name, last_name, digits]
		end
	end
end

my_csv = CSV.read('result.csv')
my_csv.sort! { |a,b| a[1].to_s.downcase <=> b[1].to_s.downcase }
	
CSV.open('result.csv', 'w') do |csv|
	my_csv.each do |elem|
		csv << elem
	end
end
