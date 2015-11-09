require 'csv'
require 'json'
require 'rexml/document'

file_name = ARGV[0]
format = ARGV[1]

class WordCounter
	def parse_file file
		result = File.open(file, 'r')
		result = result.read

		parse result
	end

	def parse string
		result = Result.new
		
		result.count += string.scan(/[[:punct:]]/).count
		words = string.downcase.scan(/\w+/)

		words.each do |word|
			result.hash[word] += 1
		end

		new_hash = Hash.new()
		new_hash = result.hash.sort_by { |key, value| [-value, key] }
	end
end

class Result < WordCounter
	attr_accessor :count, :hash

	def initialize
		@count = 0.to_i
		@hash = Hash.new()
	end

	def to_csv
		CSV.open('result.csv', 'w') do |file|
			hash.to_a.each do |elem|
				csv << elem
			end

			unless count == 0
				csv << ["\"marks\",", count]
			end
		end
	end

	def to_json
		tempHash = Hash.new()

		tempHash = {
			"marks" => count,
			"words" => new_hash
		}

		json_hash = JSON.pretty_generate(tempHash)

		File.open('result.json', 'w') do |file|
			file << json_hash
		end
	end

	def to_xml
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

		File.open('result.xml', 'w') do |file|
			file << xml_with_tabs
		end
	end
end

word_counter = WordCounter.new()
result = word_counter.parse_file file_name

case format
when 'json'
	result.to_json
when 'xml'
	result.to_xml
else
	result.to_csv
end