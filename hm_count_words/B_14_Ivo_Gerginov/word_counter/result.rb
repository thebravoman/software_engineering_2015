require 'csv'
require 'json'
require 'rexml/document'

class Result

  def initialize(marks, hash)
  	@marks = marks
  	@words = hash
  end

  def toCSV
    CSV.open('result.csv', 'w', {quote_char: " "}) do |csv|
  	  @words.sort_by{|key, value|[-value, key]}.each{ |e|
  		  csv << [e[0],e[1]]
  	  }
  	  csv << ['"marks"', @marks]
    end  
  end

  def toJSON
  	hash = {
	  "marks" => @marks.to_s,
  	  "words" => Hash[@words.sort{|key, value|[-value, key]}],
    }
    File.open('result.json', 'w') do |f|
  	  f << JSON.pretty_generate(hash)
    end
  end

  def toXML
  	xhash = Hash.new()
    xhash = Hash[@words.sort_by{|key, value|[-value, key]}]
    xfile = REXML::Document.new()
    format = REXML::Formatters::Pretty.new()
    xword_counts = xfile.add_element('word-counts')
    xmarks = xword_counts.add_element('marks')
    xwords = xword_counts.add_element('words')
    xmarks.add_text "#{@marks}"

    xhash.each do |key, value|
	  x = xwords.add_element('word')
	  x.add_attribute('count', value)
	  x.add_text "#{key}"
	end
    format.compact = true
    f = File.open('result.xml', 'w')
    xtabs = ''
    xfile.write(xtabs, 2)
    format.write(xfile, f)
    f.close
  end
  def Rectangle(x, y, w, h)
    '<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '" style="fill:rgb(100,200,100)" />'
  end

  def Text(x, y, size, string)
	'<text x="' + x.to_s + '" y="' + y.to_s + '" fill="dark-blue" font-size="' + size.to_s + '">' +  string.to_s + '</text>'
  end

  def toSVG
  	ctr = 4
  	File.open('result.svg', 'w') do |f|
  		f << '<svg xmlns = "http://www.w3.org/2000/svg" >' + "\n"
  		@words.sort_by{|key, value|[-value, key]}.each{ |e| 
  		  f << Rectangle(4, ctr, (e[1].to_i*20), 18) + "\n"
  		  f << Text(4, (ctr + 15), 20, e[0].to_s) + "\n"
  		  ctr += 22
  		}
  		f << '</svg>'
  	end
  end
end