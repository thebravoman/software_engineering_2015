require 'digest'

module WordCounter
	class Parser
		def parse(string)
			#@digest = Digest::SHA256.digest string
			result = Result.new 
			result.marks_count = string.scrub.scan(/[[:punct:]+_=#><@'$%"&*]/).count
		 	result.marks_count += string.scrub.scan("[/\]").count
			string = string.gsub("_", ' ')
			string = string.scrub.downcase.scan(/[\w]+/)
			
			string.each do |word|
				if result.word_counts.key?(word)
					result.word_counts[word] += 1 
				else
					result.word_counts[word] = 1
				end
			end
			
			result.word_counts = result.word_counts.sort_by {|word, num| [-num, word] }
			result.word_counts = result.word_counts.to_h
			result
		end
	end
end
