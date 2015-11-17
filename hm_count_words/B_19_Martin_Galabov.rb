require 'rexml/document'
require 'csv'
require 'rubygems'
require 'json'
file_path = ARGV[0]
command = ARGV[1]
class WordCounter
	def parse(txt)
		word_counter = {}  
		marks = 0
		file = txt  
		file.each_line do |line| 
			words = line.downcase.split  
			words.each do |word| 
				marks += word.count(".,()!?_")
				word = word.gsub(/[,().!?_]/,'') 
				if word_counter.key?(word) 
				  word_counter[word] += 1 
				else 
				  word_counter[word] = 1 
				end 
			end  
		end 
			 
		word_counter = word_counter.sort_by{|key, value|[-value, key]}
		Result.new(word_counter, marks) 
	end
	
	def parse_file(file_path)
		text = File.open(file_path, "r")
		parse(text)
	end
end

class Result
	attr_reader :word_counter, :marks_counter
	def initialize(word_counter, marks_counter)
	@word_counter = word_counter
	@marks_counter = marks_counter
	end
	def marks_count
		puts marks_counter
	end
	def word_counts
		word_counts = word_counter
	end
	def to_csv
		word_counter.each do |key,value| 
		 puts "#{key},#{value}"  
		end  
	 	if marks_counter > 0 then 
	 	puts "\"marks\",#{marks_counter}" 
	 	end 
	end
	def to_json
		if marks_counter > 0
			puts JSON.pretty_generate("marks" => marks_counter,"words" => word_counter)
		end
		if marks_counter == 0
			puts JSON.pretty_generate("words" => word_counter)
		end		
	end
	def to_xml
		my_xml = REXML::Document.new('')
		root = my_xml.add_element('word-counts')
		root.add_element('marks').add_text"#{marks_counter}"
		words = root.add_element('words')
		word_counter.each do |key,value|
			word = words.add_element('word',{'count'=> "#{value}"})
			word.add_text("#{key}")
		end
		formatter = REXML::Formatters::Pretty.new
		formatter.compact = true
		formatter.write(my_xml, $stdout)
	end
	
end

word_counter_class = WordCounter.new
result = word_counter_class.parse_file(file_path)

if command == 'json' 
result.to_json
elsif command == 'xml' 
result.to_xml
elsif
result.to_csv
end







