require 'csv'
require 'json'
require 'rexml/document'

def make_json hash
	File.open('result.json', 'w') do |f|
		f << hash
		#f << new_hash.to_json
	end
end

def make_xml xml
	File.open('result.xml', 'w') do |f|
		f << xml
	end
end

def make_csv hash, count
	CSV.open('result.csv', 'w') do |csv|
		hash.to_a.each do |elem|
			csv << elem
		end
		if count != 0
			csv << "\"marks\",#{count}"
		end
	end
end

file_name = ARGV[0]
format = ARGV[1]

file = File.open(file_name, "r")

hash = Hash.new()
count = 0.to_i

file.each_line {|line|
	#count += line.downcase.scan(/[.!?,:';"%()]/).size
	count += line.scan(/[[:punct:]]/).count
	words = line.downcase.scan(/\w+/)
	words.each {|word|
		if hash.has_key?(word)
			hash[word] += 1
		else
			hash[word] = 1
		end
	}
}
new_hash = Hash.new()
new_hash = hash.sort_by {|key, value| [-value, key]}

#another_hash = Hash.new()
#another_hash = hash.sort_by { |key, value| [value, key] }.reverse

tempHash = Hash.new()

if format == 'json'
	tempHash = {
		"marks" => count,
		"words" => new_hash
		#"words" => another_hash
	}
	json_hash = JSON.pretty_generate(tempHash)
	
	make_json json_hash
elsif format == 'xml'
	xml_file = REXML::Document.new()
	xml_word_counts = xml_file.add_element('word-counts')
	xml_marks = xml_word_counts.add_element('marks')
	xml_marks.add_text "#{count}"
	xml_words = xml_word_counts.add_element('words')
	
	new_hash.each do |key, value|
		word = xml_words.add_element('word')
		word.add_attribute('count', value)
		word.add_text "#{key}"
	end
	
	xml_with_tabs = ''
	xml_file.write(xml_with_tabs, 2)
	
	make_xml xml_with_tabs
else
	make_csv new_hash, count
end