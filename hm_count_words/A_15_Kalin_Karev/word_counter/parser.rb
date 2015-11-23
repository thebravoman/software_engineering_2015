require_relative './result'

module WordCounter
	class Parser
		def self.parse(string)
		answer = Result.new
		answer.mark_count = string.scan(/[^A-Za-z_]/).count
		string.gsub!(/[A-Za-z]/, ' ').downcase!
		string = string.split(" ")
		h = Hash.new(0)
		string.each do |word|
			h[word] += 1
		end	
		h = h.sort_by{|word, i| [-i, word]}
		answer.count_words = h
		answer
		end
	end
end
