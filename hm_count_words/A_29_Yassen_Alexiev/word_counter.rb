class WordCounter
	def parse_file(inputfile) 
		result = [];
		@inputfile = inputfile
		f = File.open(@inputfile, "r")
		hash = Hash.new(0)

		marks_count = 0

		f.each_line do |line|
			marks_count = marks_count + line.scan(/[-\].)(\[,!?:;%@#$^&<_>`~'"*-+\/]/).count

			alignment = line.downcase.split
			alignment.each do |word|
				word = word.gsub(/[^a-z'\s-]/, '')
					hash[word] += 1
			end	
		end
		
		hash = hash.sort_by {|word, count| [-count, word]}
	
		hash.each do |word, count|	
			result << [word,count.to_s]
		end		

		output_result = Result.new(result, marks_count)
		return output_result
	end	

	def marks_counter
		@marks_count
	end
end