filepath=ARGV[0]

File.open(filepath){
|file|
	text=""
	file.each_line{
	|line|
		text=text+line
	}
	bleh=text.scan(/[,.!?:;"()\[\]]/).count
	text.gsub!(/[,.!?:;"()\[\]]/," ")
	text.downcase!
	yarr=text.split(" ")
	word_counts = Hash.new(0)

	yarr.each do |word|
		word_counts[word] += 1
	end
	word_counts.each{
	|k,v|
		puts "#{k},#{v}"
	}
	word_counts = word_counts.sort_by {|word, count| [-count, word]}
	if bleh>0
		puts "\"marks\",#{bleh}"
	end
}
