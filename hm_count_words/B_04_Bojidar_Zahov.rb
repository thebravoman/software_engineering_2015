file = File.open(ARGV[0], 'r')
list = Hash.new

file.each_line do |line|
  
	words = line.downcase.split.each do |word|
	
		if list.has_key?(word)
     			list[word] = list[word] + 1
    		  else
			list[word] = 1
	
		end
	end
end

list.sort{ |a,b| a[1] <=> b[1] }.each do |element| 
	puts "#{element[0]},#{element[1]}"
end
