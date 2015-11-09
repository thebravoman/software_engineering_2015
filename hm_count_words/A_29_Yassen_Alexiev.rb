require 'csv'
require 'json'
require 'rexml/document'

class WordCounter
	def parse_file(inputfile) 
		result = [];
		@inputfile = inputfile
		f = File.open(@inputfile, "r")
		hash = Hash.new(0)

		marks_count = 0

		f.each_line do |line|
			marks_count = marks_count + line.scan(/[-\].)(\[,!?:;%@#$^&<_>`~'"*-+\/]/).count

			alignment = line.downcase.split
			alignment.each do |word|
				word = word.gsub(/[^a-z'\s-]/, '')
					hash[word] += 1
			end	
		end
		
		hash = hash.sort_by {|word, count| [-count, word]}
	
		hash.each do |word, count|	
			result << [word,count.to_s]
		end		

		if marks_count > 0 
			result << ["\"marks\"",marks_count]
		end

		output_result = Result.new(result, marks_count)
		return output_result
	end	

	def marks_counter
		@marks_count
	end
end

class Result
	def initialize(result, marks_count)
		@result = result
		@marks_count = marks_count
	end

	def marks_count
		@marks_count
	end

	def word_counts
		@result
	end

	def to_csv
		var = "" 
		@result.each do |word, count|	
			var = var + "#{word},#{count.to_s}\n"
		end
		var
	end		
	
	def to_json
		json_format = { :marks => "#{marks_count}", :words => @result.to_a }
		puts JSON.pretty_generate(json_format)
	end
	
	def to_xml
		format_xml_files = REXML::Document.new("")
	
		format_xml_word_counts = format_xml_files.add_element('word-counts')
	  
		format_xml_marks = format_xml_word_counts.add_element('marks')
		format_xml_marks.add_text "#{marks_count}"
	  
		format_xml_words = format_xml_word_counts.add_element('words')
	  
		@result.each do |index, key|
			word = format_xml_words.add_element('word')
			word.add_attribute( 'count', key)
	
			word.add_text "#{index}"
		end
	
		out = ""
		format_xml_files.write(out, 1)
		puts out
	end 
end

input_file = ARGV[0].to_s
format = ARGV[1].to_s
word_counter = WordCounter.new
result = word_counter.parse_file(input_file)
if format=="csv" or format == ""
	puts result.to_csv
end
if format=="json"
	puts result.to_json
end
if format=="xml" 
	puts result.to_xml
end