class WordCounter
  def parse(text)
    result = Result.new
    result.markz_count = text.scan(/[^A-Za-z_0-9 ]/).count
    text = text.gsub(/['"].+['"]|[^A-Za-z_]/, ' ').downcase
    text = text.downcase.split(" ")
    text.each do |word|
    	word = word.gsub(/[,.()"*';:-^!?]/, " ")
    	result.wordsnum[word] = result.wordsnum[word] + 1
    end

    result.wordsnum = result.wordsnum.sort_by{|word, number| word.downcase}
    result.wordsnum = result.wordsnum.sort_by{|word, number| [-number,word]}
    result
  end

  def parse_file(filename)
    fileName = File.open(filename)
    text = ''
    fileName.each_line do |line|
	text = text + line
    end
    parse text
  end
end
