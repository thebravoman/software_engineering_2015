require 'json'
require 'rexml/document'
require 'csv'
require './B_04_Bojidar_Zahov/V4/result'
class WordCounter
	def parse(string)
		result = Result.new
		result.marks = string.gsub(/[^[^a-zA-Z0-9]]/,"").split.join('').length
	 	
		string.downcase.gsub(/[\W\d_]/,' ').split.each do |word|
			result.words[word] += 1 
		end

		result.words = result.words.sort_by {|word,num| [-num,word] }
		
		return result
	end
     
	def parse_file(filename)
		file = filename.read
		parse file
	end
end
