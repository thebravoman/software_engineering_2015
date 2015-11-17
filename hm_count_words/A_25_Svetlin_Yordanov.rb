require 'csv'
require 'json'
require 'rexml/document'

class WordCounter
	def parse(string)
		result = Result.new
		
		marks_c = text.scan(/[,.!?:;"()\[\]]/).count
		words = text.downcase.gsub(/[^a-z'\s-]/, '').split(' ')
		c_words = Hash.new(0)
	
		words.each do |word|
			c_words[word] += 1
		end
	
		result.c_words = c_words.sort_by { |word, count| [-count, word] }
		result
	end

	def parse_file(filename)
		text = ''
		
		file_obj = File.open(filename, "r")
		
		file_obj.each_line do |line|
			text += line
		end
		
		parse text
	end
end

class Result
	def to_csv
		c_words.each { |word, count| puts word + ',' + count.to_s }
		puts "\"marks\"," + marks_c.to_s
	end
	
	def to_json
		json_output = { marks: marks_c, words: c_words }
		puts JSON.pretty_generate(json_output)
	end
	
	def to_xml
		document = REXML::Document.new
		word_c = document.add_element 'word-counts'
		word_c.add_element('marks').add_text("#{marks_c}")
		words = word_c.add_element 'words'
	
		c_words.each do |word, count|
			words.add_element('word').add_attribute('count', count).add_text(word)
		end
	
		output = ''
		document.write(out, 1)
		puts output
	end
	
	def marks_count
		c_words[word]
	end
end

f_name = ARGV[0].to_s
option = ARGV[1]

word_c = WordCounter.new
result = word_c.parse_file(f_name)

if(option == 'json')
	puts result.to_json
elsif(option == 'xml')
	puts result.to_xml
else
	puts result.to_csv
end