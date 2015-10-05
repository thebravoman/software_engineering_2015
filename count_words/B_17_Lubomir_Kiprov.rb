filename = ARGV[0].to_s
counter = 0
my_array = ""
File.open(filename, "r").each_line do |line|
	my_array += " " + line.upcase
end

deletesymbols =  my_array.tr("\n","")
searchword = deletesymbols.split(' ')
searchword =  searchword.sort
j = searchword.first
wordhash = {}
searchword.each do |i|
	
	if i == j
		counter = counter + 1
		
	else
		wordhash[j] = counter
		j = i
		counter = 1
	end
	
end
wordhash = wordhash.sort_by{|k, v| [-v, k]}
wordhash.each_with_index do |(k, v)|
  puts "#{k},#{v}"
end



