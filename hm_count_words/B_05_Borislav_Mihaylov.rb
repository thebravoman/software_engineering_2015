file = "Of friendship on inhabiting, diminution discovered as."
h = Hash.new

marks = file.gsub(/\w/,"").split

file.each_line { |line|
	
	words = line.split
	words.each { |w|
	
	if h.has_key?(w)
     		
		h[w] = h[w] + 1
    	else
		h[w] = 1
	end
	}
}

h.sort{|a,b| a[1]<=>b[1]}.each { |elem|
  	puts "#{elem[0]},#{elem[1]}"
}

marks_str=marks.join('').length
if (marks!=0)
	puts "marks,#{marks_str}"
end
