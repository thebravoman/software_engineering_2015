txt_file = File.open(ARGV[0])
	help = Hash.new
txt_file.each_line{ |line|
the_words = line.split
	the_words.each { |words|
	if help.has_key?(words)
		help[words] = help[words] + 1
	else
		help[words] = 1
	end
	}
}
help.sort {|first,second| (second[1] == first[1]) ? (first[0].downcase <=> second[0].downcase) : (second[1]<=>first[1])}.each { |element|
puts "#{element[0]},#{element[1]}"
} 
