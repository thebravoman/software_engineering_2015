filename = ARGV.first

res = open(filename).read.split(' ')

marks_sum = 0

res.each do |word|
	marks_sum += word.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * / \ ")
end

res.map!{|item| item.gsub(/\p{^Alnum}/, '') }
res.map!(&:downcase)

res.delete("")

histogram = Hash.new(0)

res.each do |word|
	histogram[word] += 1
end

histogram = histogram.sort_by{|word, i| [-i, word]}

histogram.each do |word, i|
	puts "#{word},#{i}"
end

puts "\"marks\",#{marks_sum}" if marks_sum != 0
