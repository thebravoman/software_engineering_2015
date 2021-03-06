require 'word_counter/result'

module WordCounter
	class Parser
    		def parse(string)
      			result = Result.new
			result.mark_counts = string.scan(/[^A-Za-z0-9_ \s]/).count
		
			string.gsub!(/[^A-Za-z0-9_\s]/, ' ')
			string.downcase!
			string = string.split(" ")

			hash = Hash.new(0)
			string.each do |word|
				hash[word] += 1
				end
		
			hash = hash.sort_by{|word, i| [-i, word]}
			result.word_counts = hash
			result
    		end
  	end
end
