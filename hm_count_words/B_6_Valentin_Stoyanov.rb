file = File.open(ARGV[0], "r")

text = String.new
number = Hash.new(0)

text = file.read
text = text.downcase.split

text.each do |word| 
	number[word] += 1 
end

number = number.sort_by {|word,num| [-num,word] }

number.each do|word, num| 
	puts word+','+num.to_s
end
