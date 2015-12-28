require 'json'
require 'rexml/document'
require 'csv'

module WordCounter
  class Result
    def initialize(words, marks)
      @words = words
      @marks = marks  
    end

    def to_csv
      @words.each do |word,occ|	
	    puts word + ',' + occ.to_s
      end
	  
      if @marks != 0
         "\"marks\",#{@marks}"
	  end
    end

    def to_json
      b = Hash[@words.map {|key,value| [key,value]}]
	  my_json = JSON.pretty_generate({marks: @marks, words: [b]})
    end
 
    def to_xml
      doc = REXML::Document.new('')
	  
	  word_counts = doc.add_element('word-counts')
	  marks = word_counts.add_element('marks').text = "#{@marks}"
	  wordz = word_counts.add_element('words')
  
      @words.each do |index, key|
	    word = wordz.add_element('word', 'count' => "#{key}").text = "#{index}"
	  end

	  formatter = REXML::Formatters::Pretty.new
	  formatter.compact = true
	  formatter.write(doc, $stdout)

      p    
  
    end
	
    def rectangle x,y,w,h	 
	  '
      <rect x="'+x.to_s+'" y="'+y.to_s+'" 
	  width="'+w.to_s+'" height="'+h.to_s+'"
      style="fill:lime;stroke:rgb(102,204,0);stroke-width:1.5;"/>
 	  '
	end

	def write_word x,y,text
      '
      <text x="'+x.to_s+'" y="'+y.to_s+'" 
      fill="dimgrey" font-size="14"
      transform="rotate(-90 '+x.to_s+','+y.to_s+')">'+text.to_s+'</text>
      '
	end

	def write_marks x,y,text
	  '
      <text x="'+x.to_s+'" y="'+y.to_s+'" 
      fill="white" opacity="0.8">'+text.to_s+'</text>
      '
	end

    def to_svg
      File.open('B_03_Bojidar_Valchovski.svg', 'w') do |f|
        f.write('<svg xmlns="http://www.w3.org/2000/svg">')
		
		keyword = @words[0][1]		
		word_spacing = 40
        bar_width = 30	
        bar_height = 200
        ratio = bar_height / keyword

        bar_height += bar_width
        offset = bar_width

        @words.each do |word, occur|
          occur *= ratio
          f.write(rectangle(offset, bar_height - occur, bar_width, occur))
          f.write(write_word(offset + word_spacing + 5, bar_height + bar_width/2 - word_spacing/2, word))
		  f.write(write_marks(offset + word_spacing/25, bar_height + bar_width/2 - word_spacing/2, (occur/ratio).to_i))
		  offset = offset + bar_width + word_spacing/2
        end

        f.write('</svg>')
      end
    end

    def marks_count
      @marks
    end

    def word_counts
      @words.each do |word, occ|
        puts "#{word},#{occ}"
      end
      p 
    end
  end
end

