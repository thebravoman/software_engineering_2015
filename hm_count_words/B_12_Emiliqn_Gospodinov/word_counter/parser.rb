require_relative 'result'

module WordCounter
	class Parser
		def parse_string (string)
			result = Result.new
			result.marks_counter = string.scan(/[\p{P}\p{S}]/u).count

			string.each_line do |line|
				line.downcase.scan(/\b[A-Za-z0-9]+\b/i).each do |word|
					result.marks_counter += word.count(".,!?()[]\"")
					word = word.gsub(/[,()!.?_"]/,'')
						if result.word_counter.has_key?(word)
							result.word_counter[word]+=1
						else
							result.word_counter[word] = 1
						end
				end
			end
			result.word_counter=result.word_counter.sort_by{|k,v| [-v,k]}	
			result	
		end
	end
end
