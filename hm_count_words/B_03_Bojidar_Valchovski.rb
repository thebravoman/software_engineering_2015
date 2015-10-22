#!/usr/bin/ruby

path = ARGV[0]
words = {} 
marks = {}
file = File.open(path, "r")

wordslist = file.read.downcase
marks = wordslist.count("()-=_+*.,?!/|:;><&%$#@!`~")
wordslist = wordslist.split(" ")	
wordslist.each do |word|
  word = word.gsub(/[,()'".=-_*&^%$#@!`~+;:<>]/,'')
  if words[word]
    words[word] += 1
  else
	words[word] = 1
  end
end

words = words.sort_by{|word,occ| word.downcase}	
words = words.sort_by{|word,occ| [-occ,word]}	 

words.each do |word,occ|	
  puts word + ',' + occ.to_s
end

puts "\"marks\",#{marks}" 	
