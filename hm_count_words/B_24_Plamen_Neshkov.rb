pattern = /\b[\w-]+\b/i

words = {}

ARGV[0].downcase.scan(pattern).each do |word|
  if words.key?(word)
    words[word] += 1
  else
    words[word] = 1
  end
end

sorted_words = words.sort_by { |word, occur| [-occur, word] }
sorted_words.each do |word, occur|
  puts "#{word},#{occur}"
end
