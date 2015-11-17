require 'json'
require 'rexml/document'
require 'csv'
require './B_6_Valentin_Stoyanov/result'

class WordCounter
	def parse(string)
		result = Result.new
		result.marks_count = string.scan(/[,.!?()":\[\];]/).count
		string = string.downcase.split

		string.each do |word|
			word = word.gsub(/[,.!?()":\[\];]/,'')
			result.word_counts[word] += 1 
		end

		result.word_counts = result.word_counts.sort_by {|word,num| [-num,word] }
		
		result
	end

	def parse_file(filename)
		file_content = filename.read
		parse file_content
	end
end
