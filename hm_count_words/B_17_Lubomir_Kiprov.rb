filename = ARGV[0].to_s
countwords = 0
countmarks = 0
index = 0
my_array = ""
File.open(filename, "r").each_line do |line|
	my_array += " " + line.downcase
end
searchword  =  my_array.tr("\n","")
searchword = searchword .split(' ')
searchword.each do |item|
	if  /[[:punct:]]/.match(item)
		countmarks = countmarks + 1	
		searchword[index] = item.gsub(/[[:punct:]]/, "")
		index = index + 1	
	else
		searchword[index] = item
		index = index + 1	
	end
end
searchword =  searchword.sort
j = searchword.first
wordhash = {}
searchword.each do |i|
	
	if i == j
		countwords = countwords + 1
		wordhash[j] = countwords
	else
		wordhash[j] = countwords
		j = i
		countwords = 1
	end
	
end
wordhash = wordhash.sort_by{|k, v| [-v, k]}
wordhash.each_with_index do |(k, v)|
  puts "#{k},#{v}"
end
if coutmarks > 0	
	print '"marks",',countmarks
	puts
end



