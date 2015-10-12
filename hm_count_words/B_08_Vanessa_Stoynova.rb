file_name = File.open(ARGV[0], "r")

counter = Hash.new

marks = 0

file_name.each_line{ |line|
	words = line.downcase.split
	words.each { |words|
	marks += words.count(".,!?:;-_'\"[]()„“*/\ ")
	words = words.gsub(/[,()!.?_"]/,'')
	
	if counter.has_key?(words)
		counter[words] += 1
	else
		counter[words] = 1
	end
	}
}

counter.sort { |first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1]) }.each { |element|
	puts "#{element[0]},#{element[1]}"
}
 
if marks != 0
	puts "\"marks\", #{marks}"
end
