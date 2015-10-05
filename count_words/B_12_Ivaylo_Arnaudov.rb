words = Hash.new(0)

File.open(ARGV[0], "r") do |f|
  f.each_line do |line|
    current_line_words = line.downcase.scan(/\w+/)
    current_line_words.each do |word|
      words[word] += 1
    end
  end
end

# http://stackoverflow.com/a/4425338/2685732
sorted_words = words.sort_by { |word, occurences| [-occurences, word] }

sorted_words.each do |word, occurences|
  puts "#{word},#{occurences}"
end
