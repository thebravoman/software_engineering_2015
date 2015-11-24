require 'csv'
require 'json'
require 'rexml/document'

class Result

  def initialize(marks, hash)
  	@marks = marks
  	@words = hash
  end

  def to_csv
    CSV.open('result.csv', 'w', {quote_char: " "}) do |csv|
  	  @words.sort{|a,b| a[0]<=>b[0]}.each{ |e|
  		  csv << [e[0],e[1]]
  	  }
  	  csv << ['"marks"', @marks]
    end  
  end

  def to_json
  	hash = {
	  "marks" => @marks.to_s,
  	  "words" => Hash[@words.sort{|a,b| a[0]<=>b[0]}],
    }
    File.open('result.json', 'w') do |f|
  	  f << JSON.pretty_generate(hash)
    end
  end

  def to_xml
  	xhash = Hash.new()
    xhash = Hash[@words.sort{|a,b| a[0]<=>b[0]}]
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
end