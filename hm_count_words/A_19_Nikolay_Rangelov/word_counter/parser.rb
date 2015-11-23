require_relative './result'

module WordCounter
	class Parser
		def self.parse(file_content)
			result = [];
			h_words = Hash.new(0)
			counter = 0
			search_by = ['.',',','!','?']


				search_by.each do |search_s|
					counter = counter + file_content.count(search_s).to_i 
				end

				words = file_content.split
				words.each do |word|
					if word.gsub!(/\W+/, '') == nil

					else
						word.gsub!(/\W+/, '')
					end

					word = word.downcase
					if not word==""
						h_words[word] += 1
					end
				end

			h_words = h_words.sort_by{|word,num| word}
			h_words = h_words.sort_by {|word,num| [-num,word]}


			h_words.each do |word, freq| 
				#puts word+','+freq.to_s
				result << [word,freq.to_s]
			end

			if not counter==0
				#puts "\"marks\",#{counter}"
				result << ["\"marks\"",counter]
			end
			o_result = Result.new(result, counter)
			return o_result
		end
	end
end
