require 'json'
require 'rexml/document'
require 'csv'
module WordCounter
  class Result

    def initialize punct, helpe, a
      @punctuation = punct
      @help = helpe
      @a = a
    end
    def rectange element, foo, foo1
      '<rect x="150" y="'+(foo-15).to_s+'" width="'+foo1.to_s+'" height="'+20.to_s+'" style="fill:blue;stroke:darkblue;stroke-width:1;stroke-opacity:0.9" />'
    end
    def word element, foo
      '<text x="1" y="'+foo.to_s+'" fill="black">'+element.to_s+'</text>'
    end
  	def to_csv
      @help.each{ |element|
    	puts "#{element[0]},#{element[1]}"
    	}
    	if @punctuation!=0
    		puts "\"marks\", #{@punctuation}"
    	end
  	end

  	def to_json
    	if @punctuation != 0
    		puts JSON.pretty_generate("marks" => @punctuation,"words" => @help)
    	else
    		puts JSON.pretty_generate("words" => @help)
    	end
  	end

  	def to_xml
  		my_xml = REXML::Document.new('')
  		word_counts = my_xml.add_element('word-counts')
  		if @punctuation != 0
  			word_counts.add_element('marks').add_text"#{@punctuation}"
  		end
  		words = word_counts.add_element('words')
  		@help.each do |key,count|
  		word = words.add_element('word', {'count' => "#{count}"}).add_text"#{key}"
  	end
  	formatter = REXML::Formatters::Pretty.new
  	formatter.compact = true
  	formatter.write(my_xml, $stdout)
    puts
  	end

    def to_svg
      File.open("B_15_Yordan_Yankulov.svg","w") do |f|
        f.write('<svg xmlns="http://www.w3.org/2000/svg">')
        foo = 30
        foo1 = 500
        d = foo1 / @a
        counter = 0
        element_remember = 0
        @help.each{ |element|
          puts foo1
          if element_remember != element[1]
            foo1 -= d
          end
          f.write(rectange element[0],foo, foo1)
          f.write(word element[0], foo)
          foo += 20

          element_remember = element[1]
        }
        f.write('</svg>')
    end
  end
  end
end
