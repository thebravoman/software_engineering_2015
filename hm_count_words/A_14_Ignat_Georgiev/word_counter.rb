class WordCounter
  def parse(string)
    result = Result.new
    result.marks_count = string.count(".,=[]()'!{}?:_;\"")
    string = string.gsub(/[^A-Za-z]/, ' ').downcase
    word_list = string.split(' ')
    word_list.each do |word|
      result.word_counts[word]+=1
    end
    result.word_counts = result.word_counts.sort_by{|word,num| word.downcase}
    result.word_counts = result.word_counts.sort_by {|word,num| [-num,word]}
    result
    end
   def parse_ruby(string)
   	result = Result.new
    result.marks_count = string.count(".,=[]()'!{}?:;\"")
    string = string.gsub(/[^A-Za-z_]/, ' ').downcase
    word_list = string.split(' ')
    word_list.each do |word|
      result.word_counts[word]+=1
    end
    result.word_counts = result.word_counts.sort_by{|word,num| word.downcase}
    result.word_counts = result.word_counts.sort_by {|word,num| [-num,word]}
    result
    end

  def parse_file(filename)
  	file_test  = filename.split(".").last
    file = File.open(filename)
    string = ''
    file.each_line do |line|
      string += line
    end
   if file_test == "rb"
   	parse_ruby string
   else
   parse string
end
  end
end
