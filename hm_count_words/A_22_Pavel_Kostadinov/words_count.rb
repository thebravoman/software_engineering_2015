class WordCounter
 
  def parse(string)
   pattern = /[,.!?'`<>*&$%^#|:+\-=;"({})\/\\\[\]@]/
  result = Result.new
  result.marks_sum = string.scan(pattern).count
   w = string.downcase.gsub(pattern, ' ').split(" ")
 
   w.each do |word|
   
   result.words[word] += 1
 end
   result.words = result.words.sort_by{|words,number| words.downcase}
   result.words = result.words.sort_by{|words,number| [-number,words]}
   result
 
 end
 
 def parse_file(filename)
   f = File.open(filename)
   text = ''
   f.each_line do |line|
 text += line
 end
   parse text
 end
end
