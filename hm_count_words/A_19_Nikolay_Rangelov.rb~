require 'csv'
require 'json'
require 'rexml/document'

class WordCounter
	def parse_file(filename)
		@filename = filename
		result = [];
		f = File.open(@filename, "r")
		h_words = Hash.new(0)
		counter = 0
		search_by = ['.',',','!','?']

		f.each_line do |line|
			search_by.each do |search_s|
				counter = counter + line.count(search_s).to_i 
			end

			words = line.split
			words.each do |word|
				if word.gsub!(/\W+/, '') == nil

				else
					word.gsub!(/\W+/, '')
				end

				word = word.downcase
				if not word==""
					h_words[word] += 1
				end
			end
		end

		h_words = h_words.sort_by{|word,num| word}
		h_words = h_words.sort_by {|word,num| [-num,word]}


		h_words.each do |word, freq| 
			#puts word+','+freq.to_s
			result << [word,freq.to_s]
		end

		if not counter==0
			#puts "\"marks\",#{counter}"
			result << ["\"marks\"",counter]
		end
		o_result = Result.new(result, counter)
		return o_result
	end

	def marks_count
		@counter
	end
end

class Result
	def initialize(result, counter)
		@result = result
		@counter = counter
	end

	def marks_count
		@counter
	end

	def word_counts
		@result
	end

	def to_csv
		res = ""
		@result.each do|word, i|	
    		res = res + "#{word},#{i.to_s}\n"
  		end
 		res
	end

	def to_json
		json_result = { :marks => "#{@counter}".to_i, :words => @result, }
  		JSON.pretty_generate(json_result)
	end

	def to_xml
		for_printing = ""
		final_xml = REXML::Document.new("")
  		words_xml = final_xml.add_element("word-counts")
  		marks_xml = words_xml.add_element("marks")
  		marks_xml.add_text "#{@counter}"
  		words_final = words_xml.add_element("words")
  
  		@result.each do |index, key|
    		word = words_final.add_element('word')
    		word.add_attribute( 'count', key)
   			word.add_text "#{index}"
   		end
  		final_xml.write(for_printing, 1)
  		for_printing
	end
end 

file_name = ARGV[0].to_s
out_format = ARGV[1].to_s

word_counter = WordCounter.new

result = word_counter.parse_file(file_name)

if out_format=="csv" or out_format == ""
	puts result.to_csv
end

if out_format=="json"
	puts result.to_json
end

if out_format=="xml" 
	puts result.to_xml
end

