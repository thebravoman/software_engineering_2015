require 'csv'

folder = ARGV[0]
ten_symbols = []

Dir.glob(folder+'*').each do |filename|
	file = filename.split('/').last
	name = file.split('_')
	
	if name[0] != nil and name[1] != nil and name[2] != nil
		first_name = name[0]
		last_name = name[1]
		digits = name[2].split('.').first
	else
		first_name = 'nothing'
		last_name = 'nothing'
	end
	
	if first_name.size == 10 && first_name != 'nothing'
		ten_symbols << [first_name, last_name]
	end
end

ten_symbols.sort! { |a,b| b[1].to_s.downcase <=> a[1].to_s.downcase }

CSV.open('result.csv', 'w') do |csv|
	ten_symbols.each do |inf|
		csv << inf
	end
end