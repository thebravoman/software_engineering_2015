require 'word_counter/parser'

module WordCounter 
	class FileParser < Parser
		def parse(file)
			words = Hash.new(0)
			max_marks = 0
			
			File.open(file, "r") do |f|
				f.each_line do |line|
				
					result = super(line)
					words = words.merge(result.word_counts.to_h) { |key, ov, nv| ov + nv }
					max_marks += result.marks_count
				end
			end
			
			sorted_words = words.sort_by { |word, occurence| [-occurence, word]}
			temp = Result.new(sorted_words, max_marks)
			temp.save_to_database(file)
			temp
		end
	end
end 
