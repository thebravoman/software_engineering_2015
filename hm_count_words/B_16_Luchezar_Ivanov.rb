words = Hash.new(0)
marks = 0
file = File.open(ARGV[0], "r")

text = file.read.to_s
text = text.downcase.split

text.each do |word| 
marks += word.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * / \ ")
word = word.tr('^A-Za-z0-9', ' ')
words[word] += 1
end

words = words.sort_by {|word,val| [-val,word]}

words.each do|word, val| 
puts word+','+val.to_s
end

if marks != 0
   puts 'marks'+','+marks.to_s
end

