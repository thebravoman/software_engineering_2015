words = Hash.new(0)
total_marks_count = 0

File.open(ARGV[0], "r") do |f|
  f.each_line do |line|
    current_line_words = line.downcase.scan(/\w+/)
    current_line_words.each do |word|
      words[word] += 1
    end
    total_marks_count += line.scan(/[[:punct:]]/).count
  end
end

# http://stackoverflow.com/a/4425338/2685732
sorted_words = words.sort_by { |word, occurences| [-occurences, word] }

sorted_words.each do |word, occurences|
  puts "#{word},#{occurences}"
end

if total_marks_count > 0
  puts "\"marks\",#{total_marks_count}"
end
