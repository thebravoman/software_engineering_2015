require 'csv'
require 'json'
require 'rexml/document'

filepath = ARGV[0]
format = ARGV[1]

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
      print "\"marks\",#{marks_count}"
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

end

class WordCounter 
  def parse(string)
   res = Result.new
   punct = 0
   h = Hash.new()
   str = string.downcase.split(" ")
   str.each do |w|
     punct = punct + w.scan(/[ ,()'"„“#$%@.?!:; ]/).count
	 w = w.gsub(/[ ,()'"„“#$%@.?!:; ]/,'')
		if(w!='')
		  if(h[w])
			h[w] += 1
		  else
			h[w] = 1
		  end
		end
   end
   h = h.sort_by { |key, value| [ -value, key ] } 
   res.setWordsMarks h, punct
   res
  end
  
  def parse_file(filename)
    f = File.open(filename, "r")
	string = " "
	f.each_line do |line|
	  string+=line
    end
	parse string
  end
end

word_counter = WordCounter.new
result = word_counter.parse_file(filepath)

if(format == "json")
  puts result.to_json
elsif(format == "xml")
  puts result.to_xml
else
  puts result.to_csv
end