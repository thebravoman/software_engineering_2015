require 'csv'

results = {}
Dir.glob("*.txt") do |file|
	line = File.readlines(file).first.strip
	p file
	request = "curl --request GET \"#{line}?a=1&b=1&c=-4\""
	results[file] = `#{request}`
	p results[file]
end

CSV.open("resuls.csv", "w") do |csv|
	results.keys.each do |file|
		csv << [file,results[file]]
	end
end
