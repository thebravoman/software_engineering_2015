class WordCounter
	def parse_file file
		result = File.open(file, 'r')
		result = result.read

		parse result
	end

	def parse string
		hash = Hash.new(0)
		count = 0.to_i

		#string.each_line do |line|
		count += string.scan(/[[:punct:]]/).count
		words = string.downcase.scan(/\w+/)

		words.each do |word|
			hash[word] += 1
		end
		#end

		new_hash = Hash.new(0)
		new_hash = hash.sort_by.to_h { |key, value| [-value, key] }

		return Result.new(count, new_hash)
	end
end