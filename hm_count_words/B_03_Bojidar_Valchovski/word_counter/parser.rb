require 'word_counter/result'

module WordCounter
  class Parser
    def parse(string)

	  words = Hash.new
	  marks = 0

	  string.scan(/[\p{P}\p{S}]/).each { marks += 1 }
	  string = string.gsub(/[^A-Za-z]/, ' ')
	  string = string.gsub("-", ' ')
	  string = string.split(" ")

	  string.each do |word|
        if words[word]
		  words[word] += 1
	    else
	      words[word] = 1
	    end
	  end

	  words = words.sort_by{|word,occ| word.downcase}	
	  words = words.sort_by{|word,occ| [-occ,word]}
	
	  parsed_result = Result.new(words,marks)
	  return parsed_result
	end
  end
end
