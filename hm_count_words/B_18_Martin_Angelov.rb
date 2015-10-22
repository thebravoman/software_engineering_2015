open = File.open(ARGV[0])
c = String.new 
count = Hash.new(0)
c = open.read.downcase.split(" ")
marks = 0


c.each do |word|
	marks += word.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * / \ ")
    word = word.gsub(/[,()'"„“.*?:;]/, '')
	count[word] += 1
end


count = count.sort_by {|word,num| word.downcase}
count = count.sort_by {|word,num| [-num,word]}


count.each do|word, num|
	
	puts word + ',' + num.to_s
end


if marks != 0
	puts '"marks"' + ',' +marks.to_s
end
