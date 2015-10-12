words_list = Hash.new
FileName = File.open(ARGV[0] , "r")

text = FileName.read.downcase
text = text.split(" ")
text.each do |word|
  if words_list.has_key?(word)
  	  words_list[word]+=1
  else
    words_list[word] = 1
  end
  words_list.sort_by{|key, val| [-val, key] }
  words_list.each { |key, val| puts "#{key},#{val}" }
end
