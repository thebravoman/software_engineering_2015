class WordCounter
	
	def parse_file(filename)
		res = ""
		res = open(filename).read
		parse res
	end
	
	def parse(string)
		result = Result.new
		result.marks_count = string.scan(/[^A-Za-z_ ]/).count
		
		string.gsub!(/[^A-Za-z]/, ' ').downcase!
		string = string.split(" ")

		hash = Hash.new(0)
		string.each do |word|
			hash[word] += 1
		end
		
		hash = hash.sort_by{|word, i| [-i, word]}
		result.word_counts = hash
		result
	end	
end
