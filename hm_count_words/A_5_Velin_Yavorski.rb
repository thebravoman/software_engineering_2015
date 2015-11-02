require 'csv'
require 'json'
require 'rexml/document'
require 'pp'

filepath = ARGV[0]
format = ARGV[1]
h = Hash.new()
punct = 0

f = File.open(filepath, "r")


f.each_line do |line|
	words = line.downcase.split
	words.each do |w|
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
end

h = h.sort_by { |key, value| [ -value, key ] } 
if(format.eql? "csv")
  h.each {|key, value| puts "#{key},#{value}"}
  if(punct != 0)
    puts "\"marks\",#{punct}"
  end
elsif(format.eql? "json")
  new_hash = {}
  new_hash[:marks] = punct
  new_hash[:words] = h
  puts (JSON.pretty_generate(new_hash))
elsif(format.eql? "xml")
  xml = REXML::Document.new
  count_words = xml.add_element("word-counts")
  marks = count_words.add_element("marks")
  marks.add_text "#{punct}"
  words = count_words.add_element("words")
  h.each do |key, value|
    word = words.add_element("word")
	word.add_attribute("count", value.to_s)
	word.add_text "#{key}"
  end
  formatter = REXML::Formatters::Pretty.new(4)
  formatter.compact = true
  formatter.write(xml, $stdout)
else
  h.each {|key, value| puts "#{key},#{value}"}
  if(punct != 0)
    puts "\"marks\",#{punct}"
  end
end