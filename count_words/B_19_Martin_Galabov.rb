
word_counter = {} 
c = 0
file = File.open(ARGV[0], "r")  
file.each_line do |line| 
  words = line.downcase.split  
  words.each do |word| 
  	c += word.count(".,()!?_")
    word = word.gsub(/[,().!?_]/,'') 
    if word_counter.key?(word) 
      word_counter[word] += 1 
    else 
      word_counter[word] = 1 
    end 
  end 
end 
   
word_counter = word_counter.sort_by{|key, value|[-value, key]} 
word_counter.each do |key,value|
  puts "#{key},#{value}" 
 end 
	puts "marks,#{c}"
