require 'csv'
require 'json'
require 'rexml/document'

module Word_counter

class Result

  attr_accessor :countmarks
  attr_accessor :wordhash
  def initialize(wordhash , countmarks)
    @countmarks = countmarks
    @wordhash = wordhash
  end


  def make_svg
	w = 15
	h = 100
	x = 0
	y = 0
	xtext = 20
	ytext = 10
	File.open("B_18_Lubomir_Kiprov.svg", 'w') do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	wrd_count = 0
	@wordhash.each do |word|
	if wrd_count != word[1].to_i
	h = h - (h/10)
	end
	f.write('<rect x="'+x.to_s+'" y="'+y.to_s+'" width="'+w.to_s+'" height="'+h.to_s+'" style="fill:blue;stroke:blue;stroke-width:2;fill-opacity:0.1;stroke-opacity:0.9"/>' )
	f.write('<text x="'+xtext.to_s+'" y="'+ytext.to_s+'" font-family="sans-serif" font-size="10px" fill="black" transform="rotate(-90,90,90)" >'+word[0].to_s+'</text>')
	
	x = x + w;
	ytext = ytext + 15
	wrd_count = word[1].to_i
	end
	f.write('</svg>')
	end
  end



  def to_csv
    wordhash.each do |word, i|
      puts "#{word},#{i}"
    end
    puts  "\"marks\",#{countmarks}" if countmarks != 0
  end
  def to_json
    require 'json'
    json_output = { marks: countmarks, words: wordhash }
    JSON.pretty_generate(json_output)
  end
  def to_xml
    xml= REXML::Document.new()
	xmlwcount = xml.add_element('word-counts')
	xmlmarks = xmlwcount.add_element('marks')
	xmlmarks.add_text "#{countmarks}"
	xmlwords = xmlwcount.add_element('words')
	
	wordhash.each do |k, v|
		word = xmlwords.add_element('word')
		word.add_attribute('count', v)
		word.add_text "#{k}"
	end
	
	output = REXML::Formatters::Pretty.new
	output.compact = true
  	output.write(xml, $stdout)
  	puts
  end
end
end


