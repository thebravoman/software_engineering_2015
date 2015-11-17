require 'rexml/document'
require 'json'

class WordCounter
	def accounts(filename)
		
		@filename = filename
		result = [];
		dumi = Hash.new(0)
		niceHash = Hash.new(0)
		file = File.open(@filename, "r")
        symbols = 0
        file.each_line do |line|

		 	symbols = symbols + line.count("./'!@#$^&,%*\\(){}[?]\":;+=`~><_-")
		  	word = line.downcase.gsub(/[^\w'\s-]/, '').split(" ")
		    
		  	word.each do |counter|
		    	dumi[counter] = dumi[counter] + 1
		  	end
		  
		end
		dumi = dumi.sort{|x, y| x <=> y}.sort{|x, y| y[1] <=> x[1]}

		dumi.each do |counter, fr|
			result << [counter,fr.to_s]
		end
		result << ["\"marks\"",symbols]

		newResult = Result.new(result, symbols)
		return newResult
		
	end

end

class Result
	def initialize(result, symbols)
		@result = result
		@counter = symbols
	end

	def marks_count
		@counter
	end

	def word_counts
		@result
	end

	def to_csv
		res = ""
		@result.each do|word, w|	
    		res = res + "#{word},#{w.to_s}\n"
  		end
 		res
	end
	
	def to_json
	niceHash = {
        :marks => "#{@counter}".to_i,
        :words => @result,
    	}
    	JSON.pretty_generate(niceHash)
	end

	def to_xml
		print = ""
		dog = REXML::Document.new('')
		wordCount = dog.add_element('word-count')
		wordCount.add_element('marks').add_text "#{@counter}"
		words = wordCount.add_element('words')
		@result.each do |currentWord, counter|
		    words.add_element('word',{'count' => counter}).add_text currentWord
		end
		
		dog.write(print, 1)
		print
	end

end


path = ARGV.first

broqch = WordCounter.new

result = broqch.accounts(path)
if ARGV[1] == 'json'
    puts result.to_json

elsif ARGV[1] == 'xml'
    puts result.to_xml
else
    puts result.to_csv
end

