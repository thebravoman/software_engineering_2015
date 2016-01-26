require 'csv' 
require 'rexml/document'
require 'net/http'
require 'sanitize'
require 'openssl'
require 'date'
file = ARGV[0] 
string = ARGV[1] 
value = ARGV[2].to_i
output = [] 
if file.start_with?("http")
	uri  = URI.parse(ARGV.first)
	http = Net::HTTP.new(uri.host, uri.port)
	if uri.scheme == 'https'
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	end
	result = http.get(uri.request_uri)
	text = Sanitize.fragment(result.body).to_s
	file = File.new("minify.csv", "w")
	File.write("minify.csv", text)
	csv_input = CSV.read(file)
else
csv_input = CSV.read(file)
end

csv_input.sort_by! do |first_row| 
	date = first_row[0].split("/") 
	[date[2].to_i, date[1].to_i, date[0].to_i] 
end 
def version1(csv_input, string, output)
	csv_input.each do |line| 
		if( line[0] == string) 
			output.push(line.join(","))
		end 
	end 
	puts output
end 
def version2(csv_input, string, output, value)
	csv_input.each do |line| 
		if( line[0] == string && (line[3].to_i > (value-10) && line[3].to_i < (value+10) )) 
			output.push(line.join(","))
		end 
	end 
	puts output
end

def version3(csv_input, string, output)
	sum = 0
	csv_input.each do |line| 
		if( line[1] == string) 
			output.push(line.join(","))
			sum += line[3].to_i
		end 
	end 
	puts output
	puts sum
end

def version4(csv_input)
	my_xml = REXML::Document.new('')
		root = my_xml.add_element('minify')
		csv_input.sort_by! do |first_row|
				date = first_row[0].split("/") 
				[first_row[1],date[2].to_i, date[1].to_i, date[0].to_i] 
		end 
		previous_account = "\n"
		csv_input.each do |line|
		if(line[0].to_s != "date")
			account = root.add_element("#{line[1]}")
			date = account.add_element("#{line[0]}")
			amount = date.add_element('amount')
			amount.add_text("#{line[3]}")
			previous_account = line[1]
		end
		end
		formatter = REXML::Formatters::Pretty.new
		formatter.compact = true
		formatter.write(my_xml, $stdout)
		puts "\n"
end

date = string.split("/")

if(Date.valid_date?(date[2].to_i,date[1].to_i,date[0].to_i))
	if(ARGV[2] == nil)
		version1(csv_input, string, output)
	else
		version2(csv_input, string, output, value)
	end
elsif (string == "xml")
	version4(csv_input)
else
	version3(csv_input, string, output)
end





 
 

