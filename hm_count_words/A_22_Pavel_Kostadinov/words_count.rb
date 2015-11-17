class WordCounter
 
  def parse(string)
    result = Result.new
   result.marks_sum = string.scan(/[,.!?:;"()\[\]]/).count
    w = string.downcase.gsub(/[,()'"„“.*?:;]/, ' ').split(" ")
	
	w.each do |words|
		
		result.h[words] += 1
	end
    result.h = result.h.sort_by{|words,number| words.downcase}
    result.h = result.hh.sort_by{|words,number| [-number,words]}
    result
 
  end

  def parse_file(filename)
    f = File.open(filename)
    text = ''
    ff.each_line do |line|
	text += line
    end
    parse text
  end
end
