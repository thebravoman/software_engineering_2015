class WordCounter

	def parse(contents)
		marks = contents.gsub(/[a-z\s]/, "");
		words = contents.gsub(/[^a-z'\s-]/, "").split

		hash = Hash.new(0)

		words.each do |word|
			hash[word] += 1
		end

		hash = hash.sort_by{|word, count| [-count, word]}

		return Result.new(marks.length, hash)
	end

	def parse_file(filename)
		contents = ""
		contents = File.open(filename, "r").read.downcase
		return parse contents    	
	end
end
