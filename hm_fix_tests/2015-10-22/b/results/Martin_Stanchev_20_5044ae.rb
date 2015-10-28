require'csv'

pattern = /\b([a-zA-Z]+?)(\..+)/

csv_file = []


Dir.glob(ARGV[0] + '*').each do |first|
	names = pattern.match(first.split('/').last)
	if names 
 		full_n = names[0]
		len = full_n.size / 2
		csv_file << [full_n, len]
	end	
end	

Dir.glob(ARGV[1] + '*').each do |second|
	names = pattern.match(second.split('/').last)
	if names
		full_n = names[0]
		len = full_n.size / 2
		csv_file << [full_n, len]  
	end
end

csv_file.sort! { |a, b| b[1] <=> a[1] }
csv_file.uniq!

CSV.open('result.csv', 'w') do |csv|
  csv_file.each { |line| csv << line } 
end

