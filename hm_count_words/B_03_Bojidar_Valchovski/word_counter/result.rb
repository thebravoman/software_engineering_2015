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

