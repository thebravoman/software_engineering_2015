class WordCounter
  def parse(string)
    result = Result.new
    string = string.downcase.split

    string.each { |word|
      $marks += word.count("-_,.;:!?(){}")
      word = word.gsub(/[-_,.;:!?(){}]/, '')
      if $count.has_key?(word)
        $count[word] += 1
      else
        $count[word] = 1
      end
    } 

    $count = $count.sort_by {|x, y| [-y, x]}

    result.inititalize($count, $marks)
  end

  def parse_file(filename)
    file = File.open filename
    text = ''

    file.each_line { |line|
      text += line
    }

    parse(text)
  end
end