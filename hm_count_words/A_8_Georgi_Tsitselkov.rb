require 'csv'
require 'json'
require 'rexml/document'

filename = ARGV[0]
output = ARGV[1]

class Result
	def intialize
		@sum_m = 0
		@word_count = Hash.new(0)
	end
 	
	attr_accessor :sum_m, :word_count

 	def to_csv
	 	word_count.each do |words,number|
		puts "#{words}, #{number}"
 		end
 
		if sum_m!= 0
			puts "\"marks\", #{sum_m}"
  		end
 	end

 	def to_json
  		json_hash = Hash.new(0)
  		json_hash["marks"] = sum_m
  		json_hash["words"] = word_count
 		puts JSON.pretty_generate(json_hash)
 	end

	def to_xml
    		xml_ = REXML::Document.new('') 
    		word_count = xml_.add_element('word-counts')
    		word_count.add_element('marks').add_text sum_m.to_s
    		words_t = word_count.add_element('words')

    		word_count.each do |word, count|
    		words_t.add_element('word', {'count' => count}).add_text word
    		end
    		formatter = REXML::Formatters::Pretty.new(4)
    		formatter.compact = true
    		formatter.write(xml_, $stdout)
 	end

end

class WordCounter
 	def parse(string)
 		 result = Result.new
 
 
 		string.each do |line|
	       	result.sum_m += line.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
        	word = line.gsub(/[^a-z\n ]/, ' ').split(" ")
	
		word.each do |words|
		result.word_count[words] = word_count[words] + 1 
	  	end
		end
 		result.word_count = result.word_count.sort_by{|words,number| words.downcase}
 		result.word_count = result.word_count.sort_by{|words,number| [-number,words]} 
 		result
 	end
 
 	def parse_file(filename)
  		filename = FILE.open(filename, "r").split(' ')
  		parse filename  
 	end
end

word_counter = WordCounter.new
result = word_counter.parse_file filename

if output == 'json'
  puts result.to_json
elsif output == 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
 
