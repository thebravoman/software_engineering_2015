file_name = ARGV[0].to_s

f = File.open(file_name, "r")
h_words = Hash.new(0)
f.each_line do |line|
	words = line.split
	words.each do |word|

		if word.gsub!(/\W+/, '') == nil

		else
			word.gsub!(/\W+/, '')
		end

		word = word.downcase
		h_words[word] += 1
	end
end

h_words = h_words.sort_by{|word,num| word}
h_words = h_words.sort_by {|word,num| [-num,word]}


h_words.each do |word, freq| 
	puts word+','+freq.to_s
end