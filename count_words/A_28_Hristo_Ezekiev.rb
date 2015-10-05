=begin
Usage: ruby indexer.rb /path/to/file.txt
Words are supposed to be separated by spaces of course
=end

file_path = ARGV[0]
file = File.open(file_path, "r") 
WORDS_ZID = {}
puts "Indexing #{file_path}"

file.each_line do |line|
  	words = line.split 
  	words.each do |word|
    		word = word.gsub(/[,()'"]/,'')
    		if WORDS_ZID[word]
      			WORDS_ZID[word] += 1
    		else
      			WORDS_ZID[word] = 1
    		end
  	end
end

puts "Indexed #{file_path}"
puts "Words count: "

WORDS_ZID.sort {|c,i| c[1] <=> i[1]}.each do |key,value|
  	puts "#{key} => #{value}"
end

puts "The end. "
