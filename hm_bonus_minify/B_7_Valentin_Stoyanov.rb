require './B_7_Valentin_Stoyanov/file_parser'
require 'net/http'
require 'sanitize'
require 'openssl'
require './B_7_Valentin_Stoyanov/web_parser'
require './B_7_Valentin_Stoyanov/v1'
require './B_7_Valentin_Stoyanov/v2'
require './B_7_Valentin_Stoyanov/v3'
require './B_7_Valentin_Stoyanov/v4'
require 'uri'

@my_csv = []

def is_date? arg
	if arg != nil
		date = arg.split('/')
	end
	if date != nil
		if date.first.match(/[[:digit:]]/) != nil
			if date[1].match(/[[:digit:]]/) != nil
				if date[2].match(/[[:digit:]]/) != nil
					return true
				end
			end
		end
	end
	return false
end


if File.file? ARGV[0]
	file_parse ARGV[0]
elsif ARGV[0] =~ /\A#{URI::regexp}\z/
	web_parse ARGV[0]
end

if ARGV[2] != nil
	value = ARGV[2]
end

if is_date? ARGV[1]
	date = ARGV[1]
	if value != nil
		v2 date, value
		puts 'v2'
	else 
		v1 date
		puts 'v1'
	end
else
	if ARGV[1] == 'xml'
		v4
		puts 'v4'
	else 
		v3 ARGV[1] 
		puts 'v3'
	end
end
















