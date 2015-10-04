
WORDS_COUNT = {} 
file = File.open(ARGV[0], "r")  
 
file.each_line do |line| 
  words = line.split  
  words.each do |word| 
    word = word.gsub(/[,()'"]/,'') 
    if WORDS_COUNT[word] 
      WORDS_COUNT[word] += 1 
    else 
      WORDS_COUNT[word] = 1 
    end 
  end 
end 
 
  
WORDS_COUNT.sort {|a,b| a[1] <=> b[1]}.each do |key,value| 
  puts "#{key},#{value}" 
 end 

