file = File.open(ARGV[0])#opens the file
content = String.new #declaring "content"- string
marks=0#declaring the counter for the marks in the text
count = Hash.new(0)#creates new Hash for counting words
content = file.read#reading the file into the string
content=content.downcase#downcasing all the words
content=content.split(" ")#spliting the string into words
content.each do |word|#counting the words 
	marks += word.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * / \ ")#counting the marks in every word
	word =word.gsub(/[,()'"„“.*?:;]/, '')
	count[word] += 1
end
count = count.sort_by{|word,num| word.downcase}#sorting alphabetically
count = count.sort_by {|word,num| [-num,word]}#sorting by the counter
count.each do|word, num|
	
	puts word+','+num.to_s
end
if marks!=0
	puts '"marks"'+','+marks.to_s
	end
