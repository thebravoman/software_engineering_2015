file_name = ARGV[0].to_s
f = File.open(file_name, "r")
hash_wrds = Hash.new(0)
i = 0
search_by = ['.',',','!','?']
f.each_line do |line|
	search_by.each do |search_s|
	i = i + line.count(search_s).to_i 
	end
	words = line.split
	words.each do |word|
		if word.gsub!(/\W+/, '') == nil
		else
			word.gsub!(/\W+/, '')
		end
		word = word.downcase
		if not word == ""
			hash_wrds[word] += 1
		end
	end
end
hash_wrds = hash_wrds.sort_by{|word,num| word}
hash_wrds = hash_wrds.sort_by {|word,num| [-num,word]}
hash_wrds.each do |word, freq| 
	puts word + ',' + freq.to_s
end
if not i == 0
	puts "\"marks\",#{i}"
end

