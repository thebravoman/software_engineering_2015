require 'csv'
require 'json'
require 'rexml/document'


w_count = Hash.new(0)

marks = 0
f = File.new(ARGV[0], "r")
while (line = f.gets)
  line.split(""). each do |l|
    "!\"\#$%&'()*+,-./:;<=>?@[\\]^_`{|}~#".split("").each do |c|
      if (c == l)
      	marks += 1
      end
    end
  end
  
  line = line.gsub!(/[!.?,;*<>=@~+-]/, "")
  line = line.downcase
  words = line.split(/\W+/)

  words.each{ |x|	
    if w_count.has_key?("#{x}")
      w_count["#{x}"] += 1
    else
      w_count["#{x}"] = 1
    end
  }
end

if ARGV[1] == 'json'
  hash = {
	  "marks" => marks.to_s,
  	  "words" => Hash[w_count.sort{|a,b| a[0]<=>b[0]}],
  }
  File.open('result.json', 'w') do |f|
  	f << JSON.pretty_generate(hash)
  end

elsif ARGV[1] == 'xml'
  xhash = Hash.new()
  xhash = Hash[w_count.sort{|a,b| a[0]<=>b[0]}]
  xfile = REXML::Document.new()
  xword_counts = xfile.add_element('word-counts')
  xmarks = xword_counts.add_element('marks')
  xwords = xword_counts.add_element('words')
  xmarks.add_text "#{marks}"

  xhash.each do |key, value|
	x = xwords.add_element('word')
	x.add_attribute('count', value)
	x.add_text "#{key}"
  end

  xtabs = ''
  xfile.write(xtabs, 2)

  File.open('result.xml', 'w') do |f|
	f << xfile
  end

else
  CSV.open('result.csv', 'w') do |csv|
  	w_count.sort{|a,b| a[0]<=>b[0]}.each{ |e|
  		csv << [e[0],e[1]]
  	}
  	csv << ["marks", marks]
  end
end
