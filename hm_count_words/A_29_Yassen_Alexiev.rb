require 'json'
require 'rexml/document'

input_file = ARGV[0]
format = ARGV[1]
f = File.open(input_file, "r")
hash = Hash.new(0)

marks_count = 0

f.each_line do |line|
	marks_count = marks_count + line.scan(/[-\].)(\[,!?:;%@#$^&<_>`~'"*-+\/]/).count
  

	alignment = line.downcase.split
	alignment.each do |word|
		word = word.gsub(/[^a-z'\s-]/, '')
			hash[word] += 1
	end	
end

hash = hash.sort_by {|word, count| [-count, word]}

if format == 'csv' || format == nil 
	hash.each do |word, count|	
		puts "#{word},#{count}"
	end
	
	if marks_count > 0 
		puts "\"marks\",#{marks_count}"
	end
end

if format == 'json'
	json_format = { :marks => "#{marks_count}", :words => hash.to_a }
	puts JSON.pretty_generate(json_format)
end

if format == 'xml'
	format_xml_files = REXML::Document.new("")

	format_xml_word_counts = format_xml_files.add_element('word-counts')
  
	format_xml_marks = format_xml_word_counts.add_element('marks')
	format_xml_marks.add_text "#{marks_count}"
  
	format_xml_words = format_xml_word_counts.add_element('words')
  
	hash.each do |index, key|
		word = format_xml_words.add_element('word')
		word.add_attribute( 'count', key)

		word.add_text "#{index}"
	end

	out = ""
	format_xml_files.write(out, 1)
	puts out
end 
