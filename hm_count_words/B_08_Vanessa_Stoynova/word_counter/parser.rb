require_relative 'result'

module WordCounter
	class Parser
		def parse(string)
			words = Hash.new(0)
			max_marks = 0
			current_words = string.downcase.scan(/\w+/)
			current_words.each do |word|
				words[word] += 1
			end
			
			max_marks = string.scan(/[[:punct:]=`~$^+|<>]/).count
			sorted_words = words.sort_by { |word, occurence| [-occurence, word] }
			
			Result.new(sorted_words, max_marks)
		end
	end
end
