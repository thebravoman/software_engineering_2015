require './B_08_Vanessa_Stoynova/result.rb'

class WordCounter
	def parse_string(string)
	
		result = Result.new
		result.marks = string.scan(/[,.!?()":\[\];]/).count
		string = string.downcase.split
		string.each do |word|
			word = word.gsub(/[,.!?()":\[\];]/,'')
			result.word_counter[word] += 1
		end
		result.word_counter[word] = result.word[counter].sort_by { |key, value| [-value, key] }
		result 
	end 
	
	def parse_file(file)
		files = File.open(file, 'r')
		what_is_in_the_file = file.read
		parse_string what_is_in_the_file
	end
end
