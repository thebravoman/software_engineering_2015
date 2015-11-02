require 'json'
require 'rexml/document'
require 'csv'

file = File.open(ARGV[0], "r")
format = ARGV[1]

text = String.new
output = String.new
number = Hash.new(0)
marks = 0

text = file.read
marks = text.scan(/[,.!?()":\[\];]/).count
text = text.downcase.split

text.each do |word|
	word = word.gsub(/[,.!?()":\[\];]/,'')
	number[word] += 1 
end

number = number.sort_by {|word,num| [-num,word] }

case format
when "json"
	hash = Hash.new(Hash.new(0))
	if not marks == 0
		hash = {"marks" => marks, "words" => number}
	else
		hash = {"words" => number}
	end
	puts JSON.pretty_generate(hash)
when "xml"
	my_xml = REXML::Document.new('')
	word_counts_tag = my_xml.add_element('word-counts')
	if not marks == 0
		marks_tag = word_counts_tag.add_element('marks')
		marks_tag.add_text(marks.to_s)
	end
	words_tag = word_counts_tag.add_element('words')
	number.each do |element|
		word_tag = words_tag.add_element('word',{'count' => element[1]})
		word_tag.add_text(element[0])
	end
	my_xml.write(output, 1)
	puts output
else
	my_csv = CSV.generate do |csv|
		number.each do |element|
			csv << element
		end
		if not marks == 0
			csv << ["marks,", marks.to_s]
		end
	end
	puts my_csv
end
