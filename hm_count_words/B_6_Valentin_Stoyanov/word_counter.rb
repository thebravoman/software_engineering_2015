require 'json'
require 'rexml/document'
require 'csv'
require './B_6_Valentin_Stoyanov/result'

class WordCounter
	def parse(string)
		result = Result.new
		result.marks_count = string.scan(/[[:punct:]+_=#><@'$%"&*]/).count
	 	result.marks_count += string.scan("[/\]").count
		string = string.gsub!("_", ' ')
		string = string.downcase.scan(/[\w]+/)
		string.each do |word|
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
