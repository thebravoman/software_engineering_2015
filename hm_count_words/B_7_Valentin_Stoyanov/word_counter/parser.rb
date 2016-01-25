module WordCounter
	class Parser < DataBase
		def parse string
			words = {}
			marks = 0
			
			marks = string.scrub.scan(/[[:punct:]+_=#><@'$%"&*]/).count
		 	marks += string.scrub.scan("[/\]").count
			string = string.gsub("_", ' ')
			string = string.scrub.downcase.scan(/[\w]+/)
			
			string.each do |word|
				if words.key?(word)
					words[word] += 1 
				else
					words[word] = 1
				end
			end
			
			words = words.sort_by {|word, num| [-num, word] }.to_h
			Result.new words, marks
		end
	end
end
