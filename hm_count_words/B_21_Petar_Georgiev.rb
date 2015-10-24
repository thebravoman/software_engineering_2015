text = String.new

file = File.open(ARGV[0] , "r")
text = file.read
marks = text.scan(/[/[,'".=-_*&^%$#@!`~+;:<>]/,'').count
text = text.split.downcase

text.each do |word_count|
	word_count = word_count.gsub(/[,()'".=-_*&^%$#@!`~+;:<>]/,'')
	number[word_count] += 1 
end

word_count = word_count.sort_by {|a, b| [-b, a]}
word_count.each do |a, b|
 	puts "#{word},#{count}"
end
if marks != 0
	puts "\"marks\",#{marks}"
end 
