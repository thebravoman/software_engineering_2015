words = Hash.new(0)

txtfile = File.open(ARGV[0], "r")

sumofmarks = IO.read(txtfile).scan(/[[:punct:]]/).length

content = IO.read(txtfile).downcase.tr('^A-Z ^0-9 ^a-z', '').split(' ')
content.each do |word|
	words[word] = words[word]+1 
end

words = words.sort_by {|key, value| [-value, key]}
words.each do |key, value|
	puts "#{key},#{value}"
end

if sumofmarks != 0 
	puts "\"marks\",#{sumofmarks}"
end
