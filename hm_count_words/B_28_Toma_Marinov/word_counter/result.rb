require 'csv'
require 'json'
require 'rexml/document'
require './B_28_Toma_Marinov/word_counter'

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
	
    	CSV.open('result.csv', 'w', {quote_char: " "}) do |file|
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

	MAX_HEIGHT = 500
	MAX_WIDTH = 100
	DEFAULT = 0

	def to_svg
		word_occurrence = @hash[0][1]
		ratio = MAX_HEIGHT / word_occurrence
		x_axis = DEFAULT
		y_axis = DEFAULT
		height = MAX_HEIGHT

		File.open('B_28_Toma_Marinov.svg', 'w') do |file|
			file << '<svg width = "'+(@hash.length * MAX_WIDTH).to_s+'" height = "'+(MAX_HEIGHT + 50).to_s+'" xmlns = "http://www.w3.org/2000/svg">'

			@hash.each do |word, count|
				file << make_rectangle(height, x_axis, y_axis)
				
				#not sure if I should print the words?
				file << print_words(x_axis, (MAX_HEIGHT + 15), word)

				x_axis = x_increment x_axis
				y_axis = y_increment word_occurrence, count, ratio
				height = height_increment y_axis
			end

			file << '</svg>'
		end
	end

	private

	def make_rectangle height, x_axis, y_axis
		'<rect height = "'+height.to_s+'" width = "'+MAX_WIDTH.to_s+'" x = "'+x_axis.to_s+'" y = "'+y_axis.to_s+'" stroke-width = "'+DEFAULT.to_s+'" fill = "blue" />'
	end

	#not sure if I should print the words?
	def print_words x, y, string
		'<text x = "'+x.to_s+'" y = "'+y.to_s+'" fill = "black">'+string.to_s+'</text>'
	end

	def x_increment value
		value += MAX_WIDTH

		return value		
	end
	def y_increment number, count, ratio
		value = (number - count) * ratio

		return value
	end
	def height_increment y
		value = MAX_HEIGHT - y

		return value
	end
end