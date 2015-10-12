mode = "r+"
filepath = ARGV[0]
filename = File.open(filepath, mode)

wordsnum = Hash.new(0)
markz_count = 0


filename.each_line do |line|
    w = line.downcase.split(" ") 
    w.each do |word|
	markz_count = markz_count + word.count(": ; * = +  [ „ ] - _ ' \ /“ ( ) . , ! ? ")
	word = word.gsub(/[, . ( ) " * ' ; : - _ ^ ! ? ]/, "")
	wordsnum[word] = wordsnum[word] + 1
    end
end
 
wordsnum = wordsnum.sort_by{|word, number| word.downcase}
wordsnum = wordsnum.sort_by{|word, number| [-number,word]}

wordsnum.each do |word, number|
   puts word + ',' + number.to_s
end
if markz_count != 0
   puts '"marks"'+','+markz_count.to_s
end

