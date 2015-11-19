require './A_13_Ivan-Asen_Ovedenski/results.rb'

class WordCounter 

	def parse_file(file)
		text = File.open(file, "r")
		parse(text)
	end

	def parse(text)
		marks = 0
		h = Hash.new(0)
		text.each_line { |line|
  			marks += line.scan(/[^A-Za-z_0-9]/).count 
			words = line.gsub!(/[^0-9A-Za-z]/, ' ').split
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
