require 'word_counter/result'

module WordCounter

	class Parser
		
		def parse_string (string)
			result = Result.new
			resul.marks = string.scan(/[\p{P}\p{S}]/u).count
			string = string.downcase.split
			string.each do|word|
				if(word.include?(" "))
					word = word.split(" ")
					word.each do |b|
						result.word_counter[b] = 1
					end
				elsif !word.empty?
					result.word_counter[b] +=  1
				end
			end
			
			result.word_counter = result.word_counter.sort_by { |key, value| [-value, key] }
			result
		end
	end
end
