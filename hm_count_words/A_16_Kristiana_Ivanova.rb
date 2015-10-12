text = ""
File.open("./readme.txt", "r").each do |file|
	
	file.each_line do |line|
		text += line
	end

	puts text
end
words = text.split

#text = gets.chomp
#text.downcase!
#words = file.split

frequencies = Hash.new(0)

words.each {|item| frequencies[item] += 1}

frequencies = frequencies.sort_by {|item, amount| [-amount, item]} #item.length
#frequencies.reverse!

frequencies.each do |item, amount|
	puts item + "," + amount.to_s
end
