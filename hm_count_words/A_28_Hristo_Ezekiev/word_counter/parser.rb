require 'word_counter/result'

module WordCounter
	class Parser
		def parse contents
			contents = contents.downcase
			marks = contents.count(",.?!():;\"\'/\\+=><*[]{}@|_#`&-")
			words = contents.gsub(/(\/\\.+\/)|[^a-z\s_0-9]/, ' ').split(' ')

			hash = Hash.new(0)

			words.each do |word|
				hash[word] += 1
			end

			
			hash = hash.sort{|word, count| word <=> count}.sort{|word, count| count[1] <=> word[1]}

			Result.new(marks, hash)
		end
	end
end
