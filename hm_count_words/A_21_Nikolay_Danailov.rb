input_file = ARGV[0]

File.open(input_file) do |file|
  text = ''

  file.each_line do |line|
    text += line
  end

  marks = text.scan(/[,.!?:;"()\[\]]/).count
  words = text.downcase.gsub(/[^a-z'\s-]/, '').split(' ')
  word_counts = Hash.new(0)

  words.each do |word|
    word_counts[word] += 1
  end

  word_counts = word_counts.sort_by { |word, count| [-count, word] }

  word_counts.each do |word, count|
    puts "#{word},#{count}"
  end

  puts "\"marks\",#{marks}" if marks > 0
end
