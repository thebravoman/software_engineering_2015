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

  def graph(size, x)
    
    y = 90
      string = '<rect width="50" height="' + (size * 10).to_s + '" x = "' + x.to_s + '" y = "' + y.to_s+ '" style="fill:pink;stroke-width:3;stroke:rgb(0,0,0)"/>'
      return string
    end
    
  def to_svg  
  
    File.open("A_16_Kristiana_Ivanova_result.svg","w") do |f|
      f.write('<svg xmlns="http://www.w3.org/2000/svg">')
      x = 10
      @word_counts.each do |word,i|
        f.write(graph(i, x))
        f.write('<text x = "'+(x+2).to_s+'" y = "200" fill = "black">'+ word +'</text>')
        x+= 60
      end
      f.write('</svg>')
    end
  
  end

end  


