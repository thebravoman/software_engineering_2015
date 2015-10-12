file = File.open(ARGV[0]) 
hash = Hash.new 

file.each_line do |line| 
	line.split.each do |word| 
		if hash.has_key?(word) 
			hash[word] = hash[word] + 1 
		else
			
			hash[word] = 1 
		end 
	
	end 

end 

hash.sort {|first,second| second[1] <=> first[1]}.each { |element|
	p "#{element[0]},#{element[1]}" 
}
