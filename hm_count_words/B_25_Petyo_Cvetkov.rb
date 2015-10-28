words_list = Hash.new
FileName = File.open(ARGV[0] , "r")

text = FileName.read.downcase
marks = text.scan(/[,.!?:;"()\[\]]/).count

text = text.gsub(/[^a-z'\s-]/, '').split(" ")
text.each do |word|
  if words_list.has_key?(word)
  	  words_list[word]+=1
  else
    words_list[word] = 1
  end
end
words_list = words_list.sort_by {|word, count| [-count, word]}
words_list.each do |word, count|
  puts "#{word},#{count}"
end
puts "\"marks\",#{marks}" unless marks == 0

