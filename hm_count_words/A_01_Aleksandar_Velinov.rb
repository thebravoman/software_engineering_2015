file = File.open(ARGV.first, "r")
 
	text = ""
	text = file.read.downcase
	
	punct_marks = text.scan(/[,.!?:;"()\[\]]/).count
	words = text.downcase.gsub(/[^a-z'\s-]/, "").split

	count_words = Hash.new(0)

	words.each do |word|
		count_words[word] += 1
	end

	count_words = count_words.sort_by{|word, counter| [-counter, word]}
	
	count_words.each do |word, counter|
		puts "#{word},#{counter}"
	end

	puts "\"marks\",#{punct_marks}" unless punct_marks == 0
