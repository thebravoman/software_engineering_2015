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

			hash = hash.sort_by{|word, count| [-count, word]}

			Result.new(marks.length, hash)
		end
	end
end