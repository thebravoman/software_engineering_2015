text = IO.read(ARGV[0]).gsub(/[^\w\s]/, '').split(" ")
unique_text = text.uniq.sort { |a,b|
  if text.count(a) == text.count(b)
    a <=> b
  else
    text.count(b) <=> text.count(a)
  end
}
unique_text.each do |word|
  word_count = text.count(word)
  puts word + ",#{word_count}"
end
