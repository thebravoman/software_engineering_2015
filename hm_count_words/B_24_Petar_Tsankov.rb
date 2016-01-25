filepath = ARGV[0]
word_count = Hash.new
file = File.new(filepath, "r")
while (line = file.gets)
  words = line.split(/\W+/)
  words.each {
    |x|
    if word_count.has_key?("#{x}")
      word_count["#{x}"] += 1
    else
      word_count["#{x}"] = 1
    end
  }
end
file.close
word_count.sort_by {|word, count| [-count, word]}.to_h
word_count.each { |word, count| puts "#{word},#{count}" }
