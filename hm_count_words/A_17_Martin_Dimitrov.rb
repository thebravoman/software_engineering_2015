fileName = File.open(ARGV[0])

i = Hash.new

fileName.each_line { |line|

 	words = line.split
  	words.each { |words|
		if counting_words.has_key?(words)
 			i[words] += 1
	    	else
			i[words] = 1
		end
	}
}

i.sort { |first,second| second[1] <=> first[1] }.each { |element|
	puts "#{element[0]}, #{element[1]}"
}
