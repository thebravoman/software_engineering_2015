require 'word_counter/result'

module WordCounter
  class Parser
    def parse(string)
    res = Result.new
    punct = 0
    h = Hash.new()
	punct = string.downcase.scan(/[^a-z0-9_\s]/).count		
    words = string.downcase.gsub(/[^a-z0-9_ ]/, ' ').split(" ").reject(&:empty?)
	words.each do |word|
	  if(word == '_')	
		punct = punct + 1
		word = word.gsub("_",'')
	  end
		if(word != '')	
	      if(h[word])
			h[word] += 1
		  else
			h[word] = 1
		  end
		end
	end
   h = h.sort_by { |key, value| [ -value, key ] }
   res.setWordsMarks h, punct
   res
  end
  end
end
