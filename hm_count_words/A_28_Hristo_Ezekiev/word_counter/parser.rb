require 'word_counter/result'

module WordCounter
	class Parser
		def self.parse contents
			contents = contents.downcase
			marks = contents.gsub(/[a-z_0-9\s]/, "");
			words = contents.gsub(/[^a-z_0-9\s]/, " ").split

			hash = Hash.new(0)

			words.each do |word|
				hash[word] += 1
			end

			hash = hash.sort{|x, y| x <=> y}.sort{|x, y| y[1] <=> x[1]}

			Result.new(marks.length, hash)
		end
	end
end
