class WordCounter
  private

  def parse(string)
	result = Result.new
	marks_counter = 0
	words = File.read(ARGV[0])
	h = Hash.new
	words.each_line do |line|
		wordz = line.downcase.split
		wordz.each do |word|
			marks_counter += word.scan(/[ ,().?!:; ]/).count
			word = word.gsub(/[ ,()'.?!:; ]/,'')
			if word!=''
				if h[word]
					h[word] += 1
	  		else
					h[word] = 1
	 			end
			end
		end
	end
	h = h.sort_by { |key, value| [ -value, key ] }
	result.setWordsMarks h, marks_counter
	result
  end

  public

  def parse_file(filename)
  	text = ''
	File.open(filename) do |file|
      		file.each_line do |line|
        		text += line
      		end
    	end
    	parse text
  end
end
