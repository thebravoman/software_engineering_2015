require './B_29_Julian_Stoev/result.rb'

class WordCounter
	def parse txt
		words_hash = Hash.new(0)

		sumofmarks = txt.scan(/[[:punct:]=`~$^+|<>]/u).length

		content = txt.downcase.tr('^A-Z ^0-9 ^a-z', ' ').split(' ')
		content.each do |word|
			words_hash[word] = words_hash[word]+1 
		end

		words_hash = words_hash.sort_by {|key, value| [-value, key]}	
		
		Result.new(words_hash, sumofmarks)
	end

	def parse_file file
		txtfile = File.open(file, "r")
		txt = IO.read(txtfile)
		parse txt
	end
end
