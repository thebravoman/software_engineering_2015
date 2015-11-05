require 'json'
require 'rexml/document'
output = ARGV[1]
file=File.open(ARGV[0])
file = file.read
list = Hash.new

def json word_c,marks
  my_json = { "marks" => "#{marks}".to_i, "words" =>word_c, }
  puts JSON.pretty_generate(my_json)
end

def xml word_c, marks
	xml_counts = REXML::Document.new("")
  	xml_word_counts = xml_counts.add_element("word-counts")
	xml_marks = xml_word_counts.add_element("marks")
	xml_marks.add_text "#{marks}"
	xml_words = xml_word_counts.add_element("words")
	word_c.each do |index, key|
		word = xml_words.add_element('word')
		word.add_attribute("count", key.to_s)
		 word.add_text "#{index}"
	end
	xml_print = ""
 	xml_counts.write(xml_print,4)
  	puts xml_print
  end
def csv word_c,marks_c
	
	word_c.reverse.each do |element| 
		puts "#{element[0]},#{element[1]}"
	end

	if (marks_c!=0)
    	print "\"marks\",#{marks_c}\n"
	end
end

marks = file.gsub(/\w/,"").split.join('').length

file.each_line do |line|
	words = line.downcase.gsub(/\W/,' ').split.each do |word|
		if list.has_key?(word)
     		list[word] = list[word] + 1
    	else
			list[word] = 1
	
		end
	end
end


list = list.sort{ |a,b| b[1] <=> a[1] }
case output
     when "json" 
     	json list, marks
     when "xml"
     	xml  list, marks
     #when "all"
     	#json list, marks 
     	#xml  list, marks 
     	#csv  list, marks
     else 
     	csv  list, marks
end
