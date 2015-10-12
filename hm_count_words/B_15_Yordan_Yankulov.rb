txt_file = File.open(ARGV[0],"r")
help = Hash.new
punctuation = 0
txt_file.each_line{ |line|
	the_words = line.downcase.split
	the_words.each { |words|
	punctuation += words.count(".,!?:;-_'\"[]()„“*/\ ")
	words = words.gsub(/[,()!.?_"]/,'')
	if help.has_key?(words)
		help[words] = help[words] + 1
	else
		help[words] = 1
	end
	}
}
help.sort {|first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1])}.each { |element|
puts "#{element[0]},#{element[1]}"
} 
if punctuation!=0
	puts "\"marks\", #{punctuation}"
end
