#file=File.open(ARGV[0], 'r')
file = "I have a computer and i use it, for programing with Ruby language vv^^!<>!<>!<>!<>!<>!^^vv Result 21"
list = Hash.new

marks = file.gsub(/\w/,"").split

file.each_line do |line|
	words = line.downcase.gsub(/\W/,' ').split.each do |word|
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

marks_str=marks.join('').length

if (marks!=0)
     print "\"marks\",sum(#{marks_str})\n"
end
