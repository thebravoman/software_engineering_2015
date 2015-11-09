require 'csv'
require 'json'
require 'rexml/document'

class Result

  def initialize(marks, hash)
  	@marks = marks
  	@words = hash
  end

  def to_csv
    CSV.open('result.csv', 'w') do |csv|
  	  @words.sort{|a,b| a[0]<=>b[0]}.each{ |e|
  		  csv << [e[0],e[1]]
  	  }
  	  csv << ["marks", @marks]
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
    xword_counts = xfile.add_element('word-counts')
    xmarks = xword_counts.add_element('marks')
    xwords = xword_counts.add_element('words')
    xmarks.add_text "#{@marks}"

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
  end

end

class WordCounter
  
  def parse f_str
  	w_count = Hash.new(0)
	marks = 0
	f_str.each_line do |line|
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
    return Result.new(marks, w_count)
  end

  def parse_file(f_path)
  	f = File.open(f_path, 'r')
	f = f.read
	parse f
  end

end

f_path = ARGV[0]
op = ARGV[1]

w_counter = WordCounter.new()
res = w_counter.parse_file(f_path)

if op == 'json'
 res.to_json
elsif op == 'xml'
 res.to_xml
else res.to_csv
end

