filename = ARGV.first

res = open(filename).read.split(' ')

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