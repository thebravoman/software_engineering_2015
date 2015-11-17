class WordCounter
  def parse(string)
    result = Result.new
    result.marks_count = string.count(".,!?:;")
    string = string.gsub(/['"].+['"]|[^A-Za-z_]/, ' ').downcase
    word_list = string.split(' ')
    word_list.each do |word|
      result.word_counts[word]+=1
    end
    result.word_counts = result.word_counts.sort_by{|word,num| word.downcase}
    result.word_counts = result.word_counts.sort_by {|word,num| [-num,word]}
    result
    end
  def parse_file(filename)
    file = File.open(filename)
    string = ''
    file.each_line do |line|
      string += line
    end
   parse string
  end
end
