file_path = ARGV[0] || "hi.txt"
WORDS_COUNT = {}
file = File.open(file_path, "r") 

puts "Indexing #{file_path}"

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

puts "Indexed #{file_path}"

puts "Words count: "

WORDS_COUNT.sort {|a,b| a[1] <=> b[1]}.each do |key,value|
  puts "#{key} => #{value}"
end
