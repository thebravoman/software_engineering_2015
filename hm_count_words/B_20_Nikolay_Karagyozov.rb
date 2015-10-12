word_list = Hash.new(0)

file = File.new(ARGV[0], "r")
while line = file.gets
  words = line.downcase.scan(/\w+/)
  words.each { |word| word_list[word] += 1 }
end
file.close

sorted_list = word_list.sort_by {|key, val| [-val, key] }.to_h
sorted_list.each { |key, val| puts "#{key},#{val}" }
