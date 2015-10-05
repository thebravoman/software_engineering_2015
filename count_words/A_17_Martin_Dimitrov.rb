fileName = File.open(ARGV[0])
counting_words = Hash.new

fileName.each_line { |line|

 	words = line.split
  	words.each { |words|
		if counting_words.has_key?(words)
 			counting_words[words] += 1
	    	else
			counting_words[words] = 1
		end
	}
}

counting_words.sort { |first,second| second[1] <=> first[1] }.each { |element|
	puts "#{element[0]}, #{element[1]}"
}
