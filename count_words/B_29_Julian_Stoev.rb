words = Hash.new(0)

txtfile = File.open(ARGV[0], "r")
content = IO.read(txtfile).downcase.tr('^A-Z ^0-9 ^a-z', '').split(' ')

content.each do |word|
	words[word] = words[word]+1 
end

words = words.sort_by {|key, value| [-value, key]}
words.each do |key, value|
	puts "#{key},#{value}"
end
