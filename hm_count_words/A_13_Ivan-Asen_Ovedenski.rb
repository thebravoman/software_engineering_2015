require 'json'
require 'rexml/document'
format = ARGV[1]
h = Hash.new 
marks = 0
file = File.open(ARGV[0], "r")
file.each_line { |line|
  marks += line.scan(/[,.!?:;"()\[\]]/).count 	
  words = line.gsub(/[^a-z'^A-Z'\s-]/, '').split
  words.each { |w|
  	w.downcase!
  	if h.has_key?(w) 
  		h[w] = h[w] + 1 
	else
   		h[w] = 1 
  	end	
   	}
  }
if format == 'json'
	json = {
		"marks" => marks,
		"words" => h.to_a
	}
	puts JSON.pretty_generate(json) 
	#puts json.to_json
elsif format == 'csv'
	h.sort{|a,b| a <=> b}.each { |word|  
	puts "#{word[0]},#{word[1]}" 
		}
		if marks > 0 
			puts "\"marks\", #{marks}"
		end
elsif format == 'xml'
	my_xml = REXML::Document.new
	body = my_xml.add_element('word-counts') 
	body.add_element('marks').add_text marks.to_s 
	words = body.add_element('words') 
	
	h.each do |word, count| 
		words.add_element('word', {'count' => count}).add_text word 
	end 
	printer = REXML::Formatters::Pretty.new(4) 
	printer.compact = true 
	printer.write(my_xml, $stdout)
end
