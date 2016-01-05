#naprqko
class Result
  attr_accessor :marks_count
  attr_accessor :word_counts
  def initialize
    @marks_count = 0
    @word_counts = Hash.new(0)
  end
  
  def to_csv
    word_counts.each do |word, number|
	puts word + ',' + number.to_s
    end
    if marks_count != 0
    	puts '"marks"'+','+marks_count.to_s
    end
  end

  def to_json
    tempHash = {
	"marks" => marks_count,
    	"words" => word_counts
    }
    puts JSON.pretty_generate(tempHash)
  end

  def to_xml
    xml_counts = REXML::Document.new("")
    xml_word_counts = xml_counts.add_element("word-counts")
    xml_marks = xml_word_counts.add_element("marks")
    xml_marks.add_text "#{marks_count}"
    xml_words = xml_word_counts.add_element("words")
    word_counts.each do |index, key|
	word = xml_words.add_element('word')
	word.add_attribute("count", key.to_s)
    	word.add_text "#{index}"
    end
    xmlprint = ""
    xml_counts.write(xmlprint, 1)
    puts xmlprint
  end

  def rect x,y,w,h
    '<rect x="'+x.to_s+'" y ="'+y.to_s+'" width ="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(211,211,211)"/>'
  end

  def to_svg
    File.open("A_27_Hristiyan_Zahariev.svg","w") do |f|
      f.write('<svg xmlns="http://www.w3.org/2000/svg">')
      x = 20
      font_size = 17
      y = word_counts.first.last
      y = y/200 + 1
      word_counts.each do |word, times|
        height = y*times*25
        width = 65
        f.write(rect(x, y, width, height))
        font_size = 14 if (word.to_s.length > 5)
        f.write('<text x="'+((x+5).to_s)+'" y="'+height.to_s+'" fill="black" font-size = "'+font_size.to_s+'">'+word.to_s+'</text>')
        f.write('<text x="'+((x+25).to_s)+'" y="'+((height+25).to_s)+'" fill = "black" font-size="20">'+times.to_s+'</text>')
        x+=70
      end
      f.write('</svg>')
    end
  end
end
