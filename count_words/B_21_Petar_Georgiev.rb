file = File.open(ARGV[0] , "r")
text = {}
file.each_line do |line|
  words = line.split 
  words.each do |word|
    if text[word]
      text[word] += 1
    else
      text[word] = 1
    end
  end
end
sorting = text.sort_by{ |word,count| [-count,word] }
sorting.each do |word,count| 
	puts "#{word},#{count}"
end
