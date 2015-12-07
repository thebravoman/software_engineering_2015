class Result
  @marks_count = 0
  @word_counts = Hash.new
  i = 0;
  
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
  
  def rect height, x
    '<rect width="15" height="' + height.to_s + '" x = "' + x.to_s + '" y = 100 style="fill = "green";stroke-width:3;stroke = "green"/>'
  end

  def text name, x
    '<text x="0" y="15" fill="black" transform="rotate(90 ' + x.to_s + ', 105)">' + name + '</text>'
  end
    
  def to_svg
    File.open('A_6_Victoria_Admasu.svg', "w") { |f|
      f.write('<svg xmlns="http://www.w3.org/2000/svg">')
    
      count.each { |x, y|
        f.write(rect(y, i + 15))
        f.write(text(x, i + 15))
        i += 15
      }
    
      f.write('</svg>')
    }
  end
end
