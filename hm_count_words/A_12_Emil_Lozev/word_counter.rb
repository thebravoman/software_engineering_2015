class WordCounter
	
	def parse_file(filename)
		res = open(filename).read.split(' ')
		parse res
	end
	
	def parse(string)
		result = Result.new
		string.each do |word|
			result.marks_count += word.count(". , ! ? :  ; = + -  _ ' \"[ ] ( ) { } „ “ * / \ ")
		end
		
		string.map!{|item| item.gsub(/\p{^Alnum}/, '') }
		string.map!(&:downcase)
		string.delete("")

		hash = Hash.new(0)
		string.each do |word|
			hash[word] += 1
		end
		
		hash = hash.sort_by{|word, i| [-i, word]}
		result.word_counts = hash
		result
	end	
end
