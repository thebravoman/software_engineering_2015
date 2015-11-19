require 'csv'
require 'json'
require 'rexml/document'
require './B_28_Toma_Marinov/word-counter'

class Result

	def initialize counter, the_hash
		@count = counter
		@hash = the_hash
	end

	def to_csv
		@hash.each do |key, value|
			puts "#{key},#{value}"
		end
		unless @count == 0
			puts "\"marks\",#{@count}"
		end
	
    	CSV.open('result.csv', 'w') do |file|
    		@hash.to_a.each do |elem|
    			file << elem
    		end

    		unless @count == 0
    			file << ["\"marks\"", @count]
    		end
    	end
  	end

	def to_json
		tempHash = Hash.new()

		tempHash = {
			"marks" => @count,
			"words" => @hash
		}

		json_hash = JSON.pretty_generate(tempHash)

		puts json_hash
		
		File.open('result.json', 'w') do |file|
			file << json_hash
		end
	end

	def to_xml
		xml_file = REXML::Document.new()
		xml_word_counts = xml_file.add_element('word-counts')
		xml_marks = xml_word_counts.add_element('marks')
		xml_marks.add_text "#{@count}"
		xml_words = xml_word_counts.add_element('words')
	
		@hash.each do |key, value|
			word = xml_words.add_element('word')
			word.add_attribute('count', value)
			word.add_text "#{key}"
		end
	
		xml_with_tabs = ''
		xml_file.write(xml_with_tabs, 2)

		puts xml_with_tabs
		
		File.open('result.xml', 'w') do |file|
			file << xml_with_tabs
		end
	end
end