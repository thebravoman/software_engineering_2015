words = Hash.new(0)
file = File.open(ARGV[0], "r")

text = file.read.to_s
text = text.tr('^A-Za-z0-9', ' ')
text = text.downcase.split

text.each do |word| 
words[word] += 1
end

words = words.sort_by {|word,val| [-val,word]}

words.each do|word, val| 
puts word+','+val.to_s
end
