word_pattern = /\b[\w-]+\b/i
punctuation_pattern = /\p{P}/

words = {}
punctuation_marks = 0

File.open(ARGV[0], "r") do |text|
  text.each_line do |line|
    line.downcase.scan(word_pattern).each do |word|
      if words.key?(word)
        words[word] += 1
      else
        words[word] = 1
      end
    end

    line.downcase.scan(punctuation_pattern).each { |word| punctuation_marks += 1 } 
  end
end

sorted_words = words.sort_by { |word, occur| [-occur, word] }
sorted_words.each do |word, occur|
  puts "#{word},#{occur}"
end

puts "\"marks\",#{punctuation_marks}" unless punctuation_marks == 0
