file = File.open(ARGV[0],"r")
text = ""
result = Hash.new ( "words" )
while ( line = file.gets )
	text += line.downcase
end
file.close

marks = text.scan(/[[:punct:]]/).size

words = text.split(/\W+/)

while !words.empty?
	word = words.first
	word_count = words.count(word)
	result[word] = word_count
	words.delete(word)
end

sorted = result.sort_by { |name,times| [-times,name] }
sorted.each { |name,times| puts "#{name},#{times}" } # Print the result
puts "\"marks\",#{marks}"
