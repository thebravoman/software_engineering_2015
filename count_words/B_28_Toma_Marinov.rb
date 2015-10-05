file = File.open(ARGV[0], "r")

hash = Hash.new

file.each_line {|line|
	words = line.downcase.split(/\W+/)
	words.each {|word|
		if hash.has_key?(word)
			hash[word] += 1
		else
			hash[word] = 1
		end
	}
}
new_hash = Hash.new

new_hash = hash.sort_by {|key, value| [-value, key]}

new_hash.each do |key, value|
	puts "#{key},#{value}"
end

=begin
new_hash = hash.sort
new_hash.sort{|a,b| b[1]<=>a[1]}.each {|elem|
	puts "#{elem[0]},#{elem[1]}"
}
=end