result = Hash.new
words = File.read(ARGV[0]).downcase.split
words.each do |word|
	if result.has_key?(word)
		result[word]+=1
	else
		result[word] = 1
	end
end

result.sort{|k,v| v[1]<=>k[1]}.each { |elements|
	puts "#{elements[0]},#{elements[1]}"
}


