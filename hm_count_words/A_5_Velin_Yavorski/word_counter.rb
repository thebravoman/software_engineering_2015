class WordCounter
  def parse(string)
    res = Result.new
    punct = 0
    h = Hash.new()
    str = string.downcase.split(" ")
    str.each do |w|
      punct = punct + w.scan(/[^a-z_]/).count
      words = w.split(/[.,(]/)
      words.each do |word|
        word = word.gsub(/[^a-z_]/,'')
		if(word == '_')	
			punct = punct + 1
			word = word.gsub("_",'')
		end
        if(word!='')
          if(h[word])
            h[word] += 1
          else
            h[word] = 1
          end
        end
     end
   end
   h = h.sort_by { |key, value| [ -value, key ] }
   res.setWordsMarks h, punct
   res
  end
  def parse_file(filename)
    f = File.open(filename, "r")
    string = " "
    f.each_line do |line|
      string+=line
    end
   parse string
  end
end