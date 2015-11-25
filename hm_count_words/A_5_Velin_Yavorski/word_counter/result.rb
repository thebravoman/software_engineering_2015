require 'csv'
require 'json'
require 'rexml/document'

class Result
  def initialize
    @marks_count = 0
    @word_counts = {}
  end
#attr_accessor:marks_count, word_counts
  def setWordsMarks words, marks
    @word_counts = words
    @marks_count = marks
  end
  def marks_count
    @marks_count
  end
  def word_counts
    @word_counts
  end
  def to_csv
    @word_counts.each {|key, value| puts "#{key},#{value}"}
    if(@marks_count != 0)
      puts "\"marks\",#{marks_count}"
   end
  end
  def to_json
    new_hash = {}
    new_hash[:marks] = @marks_count
    new_hash[:words] = @word_counts
    JSON.pretty_generate(new_hash)
  end
  def to_xml
    xml = REXML::Document.new
    count_words = xml.add_element("word-counts")
    marks = count_words.add_element("marks")
    marks.add_text "#{@marks_count}"
    words = count_words.add_element("words")
    @word_counts.each do |key, value|
       word = words.add_element("word")
       word.add_attribute("count", value)
       word.add_text "#{key}"
    end
   formatter = REXML::Formatters::Pretty.new(4)
   formatter.compact = true
   formatter.write(xml, $stdout)
   ""
  end

	def rect x, y, w, h
	'<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '" style="fill:rgb(0,190,190)" />'
	end

	def make_svg 
		File.open("result.svg", "w") do |f|
			f.write('<svg xmlns="http://www.w3.org/2000/svg">')
			distance = 20
			size = 15
			@word_counts.each do |key, value|
				f.write(rect distance, 600 - (value*10), 50, value*10)
				size = 10 if(key.to_s.length > 7)
				f.write('<text x="'+distance.to_s+'" y="'+((600 - (value*11)).to_s)+'" fill="red" font-size="'+size.to_s+'">'+key.to_s+' </text>')
				f.write('<text x="'+((distance + 20).to_s)+'" y="620" fill="black" font-size="15">'+value.to_s+' </text>')
				distance+=70
				size = 15
			end
			f.write('</svg>')
		end
	end
end
