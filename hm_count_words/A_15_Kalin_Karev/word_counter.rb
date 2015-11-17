require './A_15_Kalin_Karev/result.rb'

class WordCounter
	def parse_file(filename)
		@filename = filename
		answer = []
		work_with_file = File.open(@filename, "r")
		words_hased = Hash.new(0)
		counter = 0
		for_searching = ['.', ',', '!', '?', ';', ':']

		work_with_file.each_line do |line|
			for_searching.each do |search_s|
				counter = counter + line.count(search_s).to_i	
			end

			words = line.split
			words.each do |word|
				
					if word.gsub!(/\W+/, '') == nil
					else word.gsub!(/\W+/, '')
					end
		
				word = word.downcase
				if word != ""
					words_hased[word] += 1
				end
			end
		end

		words_hased = words_hased.sort_by{|word,num| word}
		words_hased = words_hased.sort_by {|word,num| [-num,word]}

		words_hased.each do |word, freq| 
			answer << [word,freq.to_s]
		end

		if counter != 0
			answer << ["\"marks\"",counter]
		end

		outcome = Result.new(answer, counter)
		return outcome
	end

	def marks_count
		@counter
	end

end
