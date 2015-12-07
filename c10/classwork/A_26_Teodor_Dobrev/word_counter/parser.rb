module WordCounter
	class Parser
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
	end
