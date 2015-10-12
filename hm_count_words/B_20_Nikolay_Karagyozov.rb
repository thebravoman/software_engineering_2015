word_list = Hash.new(0)
marks = []

file = File.new(ARGV[0], "r")
while line = file.gets
  words = line.downcase.scan(/\w+/)
  marks.push(line.scan(/[^\w\s]/).size)

  words.each { |word| word_list[word] += 1 }
end
file.close

sorted_list = word_list.sort_by {|key, val| [-val, key] }.to_h
sorted_list.each { |key, val| puts "#{key},#{val}" }

marks_count = marks.inject(:+)
puts "\"marks\",#{marks_count}" if marks_count > 0
