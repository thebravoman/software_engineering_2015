require 'csv'
require 'json'
require 'rexml/document'

def output_json words, marks
	json_output = { marks: marks, words: words }
	puts JSON.pretty_generate(json_output)
end

def output_xml wordhash, markz
	document = REXML::Document.new
	word_counts = document.add_element 'word-counts'
	word_counts.add_element('marks').add_text "#{markz}"
	word_counts.add_element 'words'

	words = document.elements['word-counts/words']
	wordhash.each do |word, count|
		word_element = words.add_element 'word'
		word_element.add_attribute 'count', count
		word_element.add_text "#{word}"
	end

	output = String.new
	document.write(output, 1)
	puts output
end

def output_csv words, marks
	words.each { |word, count| puts word + ',' + count.to_s }
	puts "\"marks\"," + marks.to_s
end

unless ARGV[1] == nil
	format = ARGV[1].downcase
end

File.open(ARGV[0]) do |file|

	text = String.new
	file.each_line do |line|
		text += line
	end

	markz = text.scan(/[,.!?:;"()\[\]]/).count
	words = text.downcase.gsub(/[^a-z'\s-]/, '').split(' ')

	wordhash = Hash.new(0)
	words.each do |word|
		wordhash[word] += 1
	end

	wordhash = wordhash.sort_by { |word, count| [-count, word] }

	if format == 'json'
		output_json wordhash, markz
	elsif format == 'xml'
		output_xml wordhash, markz
	elsif format == 'csv'
		output_csv wordhash, markz
	end
end
