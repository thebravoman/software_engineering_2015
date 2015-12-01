

###############################################################################
def rectangle height, position, word
	'<rect width="100" height="'+height.to_s+'" x="'+position.to_s+'"
	style="fill:black;stroke-width:3;stroke:rgb(0,0,0)"/>
	
	<text x="'+position.to_s+'" y="'+height.to_s+'" font-family="Verdana" font-size="20" fill="blue" > '+word.to_s+' </text>'
end


words = {}
punctuation_marks = 0

word_separator = /\b[\w-]+\b/i
punctuation_marks_separator = /\p{P}/


File.open(ARGV[0], "r") do |text|
  text.each_line do |line|
    line.downcase.scan(word_separator).each do |word|
      if words.key?(word)
        words[word] += 1
      else
        words[word] = 1
      end
    end

    line.downcase.scan(punctuation_marks_separator).each { |word| punctuation_marks += 1 } 
  end
end

sorted_words = words.sort_by { |word, occur| [-occur, word] }
bar_position = 0
File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	sorted_words.each do |word, occur|
		bar_height = occur*100
		bar_position = (bar_position + 200)
		f.write (rectangle "#{bar_height}", "#{bar_position}", "#{word}")
	end
	f.write('</svg>')
end
