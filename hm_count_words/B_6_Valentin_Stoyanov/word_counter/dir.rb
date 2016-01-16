module WordCounter
	class DirParser < FileParser
		def dir_parse path
			all_words = {}
			marks_sum = 0
			result = Result.new all_words, marks_sum
			
			Dir.glob(path + '**/*') do |filename|
				if File.file? filename
					result = file_parse filename
					all_words.merge!(result.word_counts) {|key, oldval, newval| newval + oldval}
					marks_sum += result.marks_count
				end
			end
			
			result.word_counts = all_words.sort_by {|key, val| [-val, key] }.to_h
			result.marks_count = marks_sum
			result	
		end
	end
end
