require 'csv'

def send_request line_number, params
	results = {}
	Dir.glob("*.txt") do |file|
		lines = File.readlines(file)
		if lines.size > line_number
			line = lines[line_number].strip
			p file
			request = "curl --request GET \"#{line}?#{params}\""
			results[file] = `#{request}`
			p results[file]
		end
	end
	results
end


def write_file results
	CSV.open("resuls.csv", "w") do |csv|
		results.keys.each do |file|
			csv << [file,results[file]]
		end
	end
end
# url quadratic - 0 "a=1&b=1&c=-4"
# url quadratic json - 1 "json=%7B%22a%22%3A1%2C%22b%22%3A1%2C%22c%22%3A-4%7D"
# url count words - 2
results = send_request ARGV[0].to_i, ARGV[1]
write_file results
