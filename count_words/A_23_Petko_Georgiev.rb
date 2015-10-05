file = File.open(ARGV[0],"r") # Open the file
text = ""
result = Hash.new ( "words" )
while ( line = file.gets ) # Read the text
	text += line
end
file.close # Close the file

words = text.split(" ")

while !words.empty?
	word = words.first
	word_count = words.count(word)
	result[word] = word_count
	words.delete(word)
end

sorted = result.sort_by { |name,times| [-times,name] }
sorted.each { |name,times| puts "#{name} #{times}" } # Print the result
