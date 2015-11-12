require 'json'
require 'rexml/document'

class Word_counter
	def parse_file(path)
		list = Hash.new
		pathern = path
		file=File.open(pathern)
		file = file.read
		marks = file.gsub(/\w/,"").split.join('').length
		file.each_line do |line|
			words = line.downcase.gsub(/\W/,' ').split.each do |word|
				if list.has_key?(word)
     					list[word] = list[word] + 1
    				else
					list[word] = 1
				end
			end
		end
	
		list = list.sort{ |a,b| b[1] <=> a[1] }
		return parse_result = Result.new(list,marks)
	end
	
	def parse(str)
		
		list = Hash.new
		marks = str.gsub(/\w/,"").split.join('').length
		str.each_line do |line|
			words = line.downcase.gsub(/\W/,' ').split.each do |word|
				if words.match(word)
     					words[word]+= 1
    				else
					words[word]+= 1
				end
			end
		end
	
	 	words = words.sort{ |a,b| b[1] <=> a[1] }
		return parse_result = Result.new(words,marks)
	end
end

class Result
	def initialize(words, marks)
		@words = words
		@marks = marks
	end
	
	def to_json
  		my_json = { "marks" => "#{@marks}".to_i, "words" =>@words, }
  		puts JSON.pretty_generate(my_json)
	end
	
	def to_xml 
		xml_counts = REXML::Document.new("")
  		xml_word_counts = xml_counts.add_element("word-counts")
		xml_marks = xml_word_counts.add_element("marks")
		xml_marks.add_text "#{@marks}"
		xml_words = xml_word_counts.add_element("words")
		@words.each do |index, key|
			word = xml_words.add_element('word')
			word.add_attribute("count", key.to_s)
			word.add_text "#{index}"
		end
		xml_print = ""
 		xml_counts.write(xml_print,4)
  		puts xml_print
  	end
  	
	def to_csv 
			
		@words.reverse.each do |element| 
			puts "#{element[0]},#{element[1]}"
		end

		if (@marks!=0)
   		 	print "\"marks\",#{@marks}\n"
		end
	end
end

result = Word_counter.new.parse_file(ARGV[0])
output = ARGV[1]
case output
     when "json" 
     	puts result.to_json
     when "xml"
     	puts result.to_xml
     #when "all"
     	#puts result.to_json
     	#puts result.to_xml
     	#puts result.to_csv
     else 
     	puts result.to_csv
end
