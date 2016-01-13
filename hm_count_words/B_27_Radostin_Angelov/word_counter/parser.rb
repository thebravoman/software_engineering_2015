module WordCounter
  class Parser
    def parse(text, identifier)
    	words_count = Hash.new(0)
	    words = text.downcase.scan(/\b[A-Za-z0-9]+\b/i)
	    words.each {
    		|x|
    		if words_count.has_key?("#{x}")
    		    words_count["#{x}"] += 1
    		else
    		    words_count["#{x}"] = 1
    		end
	    }

    	words_count = words_count.sort_by {|word, count| [-count, word]}
    	marks_count = text.scan(/[\p{P}\p{S}]/).size
    	result = Result.new(words_count, marks_count, identifier)
        result.save
        return result
    end
  end
end
