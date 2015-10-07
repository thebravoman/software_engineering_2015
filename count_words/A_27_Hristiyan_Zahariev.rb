mode = "r+"
filepath = ARGV[0]
filename = File.open(filepath, mode)

wordsnum = Hash.new(0)


filename.each_line do |line|
  w = line.downcase.split(" ") 
  w.each do |word|
	word = word.gsub(/[,()'".]/,'')
	wordsnum[word] = wordsnum[word] + 1
  end
end

wordsnum = wordsnum.sort_by{|word, number| word.downcase}
wordsnum = wordsnum.sort_by{|word, number| [-number,word]}

wordsnum.each do |word, number|
  p #{word} + #{number}
end


