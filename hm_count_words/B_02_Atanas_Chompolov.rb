file = File.open(ARGV[0], "r")
count = Hash.new(0)
marks = 0

file.each_line do |line|
	marks += line.scan(/[,.!?:;"()\[\]]/).count
	w = line.downcase.gsub(/[^a-z'\n- ]/, ' ').split(" ")
    
	w.each do |word|
		count[word] += 1
	end	
end


count = count.sort_by{|word,num| word.downcase}
count = count.sort_by{|word,num| [-num,word]}

count.each do |word, num|
	puts word + ',' + num.to_s
end

if marks != 0
	puts '"marks",' + marks.to_s
end

