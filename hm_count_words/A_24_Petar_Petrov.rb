text = IO.read(ARGV[0]).downcase
marks = text.count(",.?!():;-\"\'/")
words = text.gsub(/[^a-z\s]/,"").split(" ")
unique_text = words.uniq.sort { |a,b|
  if words.count(a) == words.count(b)
    a <=> b
  else
    words.count(b) <=> words.count(a)
  end
}
unique_text.each do |word|
  word_count = words.count(word)
  puts word + ",#{word_count}"
end
if marks > 0
  puts "marks,#{marks}"
end
