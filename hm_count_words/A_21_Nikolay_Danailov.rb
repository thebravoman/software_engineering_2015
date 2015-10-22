File.open(ARGV[0]) do |file|
	text = ""

	file.each_line do |line|
		text += line
	end

	marks = text.scan(/[,.!?:;"()\[\]]/).count
	words = text.downcase.gsub(/[^a-z'\s-]/, '').split(" ")
	word_counts = Hash.new(0)

	words.each do |word|
		word_counts[word] += 1
	end

	word_counts = word_counts.sort_by {|word, count| [-count, word]}
	
	word_counts.each do |word, count|
		puts "#{word},#{count}"
	end

	if marks > 0
		puts "\"marks\",#{marks}"
	end
end
