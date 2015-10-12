file_name = ARGV[0].to_s

f = File.open(file_name, "r")
h_words = Hash.new(0)
counter = 0
search_by = ['.',',','!','?']

f.each_line do |line|
	search_by.each do |search_s|
	counter = counter + line.count(search_s).to_i 
	end

	words = line.split
	words.each do |word|
		if word.gsub!(/\W+/, '') == nil

		else
			word.gsub!(/\W+/, '')
		end

		word = word.downcase
		if not word==""
			h_words[word] += 1
		end
	end
end

h_words = h_words.sort_by{|word,num| word}
h_words = h_words.sort_by {|word,num| [-num,word]}


h_words.each do |word, freq| 
	puts word+','+freq.to_s
end

if not counter==0
	puts "\"marks\",#{counter}"
end
