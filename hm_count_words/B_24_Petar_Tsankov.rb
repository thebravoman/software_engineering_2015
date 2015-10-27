wordPattern = /\b[\w-]+\b/i
punctuationPattern = /\p{P}/
words = {}
punctuationMarks = 0
File.open(ARGV[0], "r") do |text|
text.each_line do |line|
line.downcase.scan(wordPattern).each do |word|
if words.key?(word)
words[word] += 1
else
words[word] = 1
end
end
line.downcase.scan(punctuationPattern).each { |word| punctuationMarks += 1 } 
end
end
sortedWords = words.sort_by { |word, occur| [-occur, word] }
sortedWords.each do |word, occur|
puts "#{word},#{occur}"
end
puts "\"marks\",#{punctuationMarks}" unless punctuation_marks == 0