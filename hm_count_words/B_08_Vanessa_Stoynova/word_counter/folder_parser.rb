require 'word_counter/file_parser'

module WordCounter
	class FolderParser < FileParser
		def parse(folder)
		
			words = Hash.new(0)
			max_marks = 0
			
			files = Dir.glob("#{folder}/**/*").select { |file| File.file? file }
  			files.each do |file|
				if File.file?(file)
					result = super(file)
					words = words.merge(result.word_counts.to_h) { |key, old, new| old + new }
					max_marks += result.marks_count
				end
			end	
			
			sorted_words = words.sort_by { |word, occurence| [-occurence, word]}
			Result.new(sorted_words, max_marks)
		end
	end
end
