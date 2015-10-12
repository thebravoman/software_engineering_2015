#!/usr/bin/ruby

path = ARGV[0]	# Get the file path from the command line parameter
words = {} # Store the words in this array 
file = File.open(path, "r")	# Access the specified file in read-only mode

wordslist = file.read.downcase	# Saves the content in the file in our wordslist
wordslist = wordslist.split(" ")	# Removes spaces between the words
wordslist.each do |word|	# Iterates through our wordslist array, removing any useless characters and counting our words
  word = word.gsub(/[,()'".]/,'')
  if words[word]
    words[word] += 1
  else
	words[word] = 1
  end
end

words = words.sort_by{|word,occ| word.downcase}	# Sort our array in alphabetical order
words = words.sort_by{|word,occ| [-occ,word]}	# Sort our array in a numerical order 

words.each do |word,occ|	# Iterates through our array and prints the words and number of occurences for each one of them
  puts word + ',' + occ.to_s
end
