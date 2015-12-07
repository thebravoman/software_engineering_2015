require 'rexml/document'
require 'rexml/element'
require 'json'
require 'csv'

result = Hash.new
words = File.read(ARGV[0])
my_xml = REXML::Document.new('')
marks_counter = 0

words.each_line do |line|
	wordz = line.downcase.split
	wordz.each do |word|
		marks_counter += word.count(".,!?()[]\"")
		word = word.gsub(/[,()!.?_"]/,'')
			if result.has_key?(word)
				result[word]+=1
			else
				result[word] = 1
			end
	end
end
result=result.sort{|k,v| (v[1] == k[1]) ? (k[0] <=> v[0]) : (v[1]<=>k[1])}

if ARGV[1] == 'csv' or ARGV[1] == nil
	result.each do |elements|
		puts "#{elements[0]},#{elements[1]}"
	end
	if marks_counter!=0
		puts '"marks",'+"#{marks_counter}"
	end
	CSV.open("result.csv", "w") do |csv|
  	result.each {|element| csv << element}
	end

elsif ARGV[1] == 'json'
	puts JSON.pretty_generate("marks" => marks_counter,"words" => result.to_a)
elsif ARGV[1] == 'xml'
	word = my_xml.add_element('word-counts')
	word.add_element('marks').add_text"#{marks_counter}"
	words_element = REXML::Element.new 'words'
	result.each do |k,v|
		words_element.add_element('word',{'count' => v}).add_text("#{k}")
	end
	word.add_element(words_element)
	puts my_xml
end

=begin
v 4/5

require_relative 'B_12_Emiliqn_Gospodinov/word_counter'
format = ARGV[1]

is_url = ARGV[0].split("_").last.split("/").first

if (is_url == "https:") || (is_url == "http:") 
  result = WordCounter::parse_web(ARGV[0])
else
  result = WordCounter::parse_file(ARGV[0])
end

if format == "json"
  puts result.to_json
elsif format == "xml"
  puts result.to_xml
elsif format == "csv" or format == nil
  puts result.to_csv
end
=end
