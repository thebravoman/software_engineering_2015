#require 'json'
#require 'rexml/document'
#require_relative ''

#module WordCounter
class Result
  attr_accessor :marks_count
  attr_accessor :word_counts

  def initialize
    @marks_count = 0
    @word_counts = Hash.new(0)
  end

  def to_csv
    word_counts.each do |item, amount|
      puts item + "," + amount.to_s
    end

    if marks_count != 0
      puts "\"marks\"," + marks_count.to_s
    end
  end

  # -----------------------------------------------------
  def to_xml
    xml_document = REXML::Document.new
    xml_item_counts = xml_document.add_element 'word-counts'
    xml_marks = xml_item_counts.add_element 'marks'
    xml_marks.add_text "#{marks_count}"
    xmls_items = xml_item_counts.add_element 'words' # xml words

    word_counts.each do |item, amount|
      item = xmls_items.add_element('word', 'count' => amount).text = "#{item}" #item = word
    end

    formatter = REXML::Formatters::Pretty.new(2)
    formatter.compact = true
    formatter.write(xml_document, $stdout)
  end

  # ----------------------------------------------------
  def to_json
    json_output = { "marks" => marks_count, "items" => word_counts}
    puts JSON.pretty_generate(json_output)
  end

  def rect x,y,width,height
'<rect width="'+width.to_s+'" y ="'+y.to_s+'" x ="'+x.to_s+'" height="'+height.to_s+'" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>'
end
  def to_svg
    File.open("result.svg","w") do |f|
      f.write('<svg xmlns="http://www.w3.org/2000/svg">')
        temp = word_counts.first.last
        y = temp
        temp = temp/200 +1 
        x = 40
        word_counts.each do |word, num|
          temp_y = (300- y)-y
          f.write(rect(x,temp_y,30,temp*num*10))
            f.write('<text x="'+(x+2).to_s+'" y="'+(temp_y-7).to_s+'" textLength = "'+(word.length*5).to_s+'" fill="black">'+word+'</text>')
            x+=60
        end
      f.write('</svg>')
    end
  end
end  


