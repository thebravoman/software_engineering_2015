require 'json'
require 'rexml/document'

content_hash = Hash.new(0)
words_hash = Hash.new(0)
txtfile = File.open(ARGV[0], "r")

sumofmarks = IO.read(txtfile).scan(/[[:punct:]]/).length

content = IO.read(txtfile).downcase.tr('^A-Z ^0-9 ^a-z', '').split(' ')
content.each do |word|
	words_hash[word] = words_hash[word]+1 
end

words_hash = words_hash.sort_by {|key, value| [-value, key]}

if (ARGV[1]=='json')
	content_hash["marks"] = sumofmarks
	content_hash["words"] = words_hash
	puts JSON.pretty_generate(content_hash)

elsif (ARGV[1]=='xml')
	file_xml = REXML::Document.new('')
	word_count = file_xml.add_element('word-count')
	marks_xml = word_count.add_element('marks').add_text(sumofmarks.to_s)
	words_xml = word_count.add_element('words')
	words_hash.each do |key, value|
		words_xml.add_element('word').add_text(key).add_attribute('count', value.to_s)
	end
	form = REXML::Formatters::Pretty.new
 	form.compact = true
  	form.write(file_xml, $stdout)
  	puts

else
	words_hash.each do |key, value|
		puts "#{key},#{value}"
	end	
	if sumofmarks != 0 
		puts "\"marks\",#{sumofmarks}"
	end
end

