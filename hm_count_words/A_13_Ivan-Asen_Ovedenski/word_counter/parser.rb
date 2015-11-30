require 'word_counter/results.rb'

module WordCounter
	
class Parser

	def self.parse(text)
		marks = 0
		h = Hash.new(0)
		text.each_line { |line|
  			marks += line.scan(/[^A-Za-z_0-9\s]/).count 
			words = line.gsub(/[^A-Za-z_0-9]/, ' ').split
			words.each { |w|
				w.downcase!
				if h.has_key?(w) 
					h[w] = h[w] + 1 
				else
					h[w] = 1 
				end	
			}
			}
			h = h.sort_by{|word, count| [-count, word]}
		
		Result.new(marks,h)
	end
end	
end
