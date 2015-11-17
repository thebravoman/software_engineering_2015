class Result
  @marks_count = 0
  @word_counts = Hash.new

  def inititalize(count, marks)
    @word_counts = count
    @marks_count = marks
  end

  def marks_count
    @marks_count
  end

  def word_counts
    @word_counts
  end
  
  def to_json
    j_count = {
      "marks" => @marks_count,
      "words" => @word_counts 
    }

    puts JSON.pretty_generate(j_count)
  end

  def to_csv
    @word_counts.each { |x, y|
      puts "#{x},#{y}"
    }

    if @marks_count > 0
      puts "\"marks\",#{@marks_count}"
    end
  end

  def to_xml
    x_count = REXML::Document.new
    
    num = x_count.add_element('counts')
    mark = num.add_element('marks')
    mark.add_text "#{@marks_count}"
    x_words = num.add_element('words')

    @word_counts.each { |x, y|
      w = x_words.add_element('word')
      w.add_attribute('count', y)
      w.add_text "#{x}"
    }

    output = ''
    x_count.write(output, 1)

    puts output
  end
end