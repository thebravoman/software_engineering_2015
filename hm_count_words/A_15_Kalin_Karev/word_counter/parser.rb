require_relative './result'

module WordCounter
	class Parser
		def parse(string)
			res = Result.new
			s = 0
			word_h=Hash.new()
			s = string.downcase.scan(/[^a-z0-9_\s]/).count	
			words = string.downcase.gsub(/[^a-z0-9_ ]/, ' ').split(" ").reject(&:empty?)		
			words.each do |word|
				if(word == '_')
					s = s + 1
					word = word.gsub("_",'')
				end
				if (word != '')
				if (word_h[word])
					word_h[word] += 1
				else
					word_h[word] = 1 
				end
				end
			end
			
			word_h=word_h.sort_by{|key, value| [ -value, key ]}
			res.SetWordsMarks word_h, s
			res 	
		end
	end
end
