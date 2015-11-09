require 'csv'
require 'json'
require 'rexml/document'


def format_in_csv words, marks
	words.each { |word, count| puts word + ',' + count.to_s }
	puts "\"marks\"," + marks.to_s
end

def format_in_json words, marks
	json_output = { marks: marks, words: words }
	puts JSON.pretty_generate(json_output)
end

def format_in_xml counted_words, marks_count
	document = REXML::Document.new
	word_counts = document.add_element 'word-counts'
	word_counts.add_element('marks').add_text "#{marks_count}"
	word_counts.add_element 'words'

	words = document.elements['word-counts/words']
	counted_words.each do |word, count|
		word_element = words.add_element 'word'
		word_element.add_attribute 'count', count
		word_element.add_text "#{word}"
	end

	output = String.new
	document.write(output, 1)
	puts output
end


unless ARGV[1] == nil
	format = ARGV[1].downcase
end

File.open(ARGV[0]) do |file|

	text = String.new
	file.each_line do |line|
		text += line
	end

	marks_count = text.scan(/[,.!?:;"()\[\]]/).count
	words = text.downcase.gsub(/[^a-z'\s-]/, '').split(' ')

	counted_words = Hash.new(0)
	words.each do |word|
		counted_words[word] += 1
	end

	counted_words = counted_words.sort_by { |word, count| [-count, word] }

	if format == 'json'
		format_in_json counted_words, marks_count
	elsif format == 'xml'
		format_in_xml counted_words, marks_count
	else
		format_in_csv counted_words, marks_count
	end
end
