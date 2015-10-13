word_counter = {}
marks = 0
file = File.open(ARGV[0], "r")
file.each_line do |line|
  marks = line.scan(/[,.!?()":\[\];]/).count
  word = line.downcase.split()
  word.each do |word|
    word = word.gsub(/[,.!?()":\[\];]/,'') 
    if word_counter.key?(word)
      word_counter[word] += 1
    else
      word_counter[word] = 1
    end
  end
end
sorted_array = word_counter.sort_by {|key, value|[-value, key]}
sorted_array.each do |key,value|
  puts "#{key},#{value}"
end
if marks != 0
  puts "\"marks\",#{marks}"
end
