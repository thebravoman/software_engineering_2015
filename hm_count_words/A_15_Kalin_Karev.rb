require_relative './A_15_Kalin_Karev/word_counter'

file_name = ARGV[0]
format_print = ARGV[1]
#format = "string"

def dir file_name
	s_parse = ""
	Dir["#{file_name}/**/*.*"].each do |word|
		if !(word.include? "~")
			File.readlines(word).each do |l|
				s_parse << l.to_s
			end
		end
	end
	s_parse
end

if( file_name.start_with?('http://') || file_name.start_with?('https://'))
	answer = WordCounter.parse_webpage(file_name)
elsif File.file? file_name
	answer = WordCounter.parse_file(file_name)
elsif file_name == "-d"
	answer = WordCounter.parse (dir format_print)
else
	answer = WordCounter.parse file_name 
end

=begin
if format_print == "csv"
	puts answer.to_csv
end
=end

if format_print == "json"
	puts answer.to_json
end

if format_print == "xml"
	puts answer.to_xml
else 
	puts answer.to_csv
end
answer.make_svg
