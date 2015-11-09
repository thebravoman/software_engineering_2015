require 'json'
require 'csv'
require 'rexml/document'

file_name = ARGV[0].to_s
format = ARGV[1].to_s

class WordCounter
	def parse_file(filename)
		@filename = filename
		answer = []
		work_with_file = File.open(@filename, "r")
		words_hased = Hash.new(0)
		counter = 0
		for_searching = ['.', ',', '!', '?', ';', ':']

		work_with_file.each_line do |line|
			for_searching.each do |search_s|
				counter = counter + line.count(search_s).to_i	
			end

			words = line.split
			words.each do |word|
				
					if word.gsub!(/\W+/, '') == nil
					else word.gsub!(/\W+/, '')
					end
		
				word = word.downcase
				if word != ""
					words_hased[word] += 1
				end
			end
		end

		words_hased = words_hased.sort_by{|word,num| word}
		words_hased = words_hased.sort_by {|word,num| [-num,word]}

		words_hased.each do |word, freq| 
			answer << [word,freq.to_s]
		end

		if counter != 0
			answer << ["\"marks\"",counter]
		end

		outcome = Result.new(answer, counter)
		return outcome
	end

	def marks_count
		@counter
	end

end

class Result
	def initialize(answer, counter)
		@answer = answer
		@counter = counter
	end

	def marks_count
		@counter
	end

	def word_counts
		@answer
	end

	def to_csv
		res = ""
		@answer.each do |word, i|
			res = res + "#{word}, #{i.to_s}\n"		
		end
		res
	end

	def to_json
		json_result = { :marks => "#{@counter}".to_i, :words => @answer, }
  		JSON.pretty_generate(json_result)
	end

	def to_xml
		product = ""
		final_xml = REXML::Document.new("")
  		words_xml = final_xml.add_element("word-counts")
  		marks_xml = words_xml.add_element("marks")
  		marks_xml.add_text "#{@counter}"
  		words_final = words_xml.add_element("words")
  
  		@answer.each do |index, key|
    			word = words_final.add_element('word')
    			word.add_attribute( 'count', key)
   			word.add_text "#{index}"
   		end
  		final_xml.write(product, 1)
  		product	
	end

end

word_counter = WordCounter.new

answer = word_counter.parse_file(file_name)

if format == "csv" || format == ""
	puts answer.to_csv
end

if format == "json"
	puts answer.to_json
end

if format == "xml"
	puts answer.to_xml
end
