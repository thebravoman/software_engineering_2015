text = "" 
File.open(ARGV[0]) do |file|
	file.each_line do |line|
		text += line
	end
end
#words = text.split

#text = gets.chomp
#text.downcase!
#words = file.split

marks = text.scan(/[,.!?:;"()\[\]]/).count 
words = text.downcase.gsub(/[^a-z\n ]/, '').split(" ") 

frequencies = Hash.new(0)

words.each {|item| frequencies[item] += 1}

frequencies = frequencies.sort_by {|item, amount| [-amount, item]} #item.length
#frequencies.reverse!

frequencies.each do |item, amount|
	puts item + "," + amount.to_s
end

if marks > 0
	puts "marks,#{marks}"
end

