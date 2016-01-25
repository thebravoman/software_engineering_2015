file_name = File.open(ARGV[0])
counter = Hash.new
file_name.each_line { |line|
 	words = line.split
  	words.each { |words|
		if counter.has_key?(words)
 			counter[words] += 1
	    	else
			counter[words] = 1
		end
	}
}
counter.sort { |first,second| second[1] <=> first[1] }.each { |element|
	puts "#{element[0]},#{element[1]}"
} 
