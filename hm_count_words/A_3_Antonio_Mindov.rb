require 'json'
require 'rexml/document'

file = File.open(ARGV[0], "r")

contents = ""
contents = file.read.downcase
marks = contents.gsub(/[a-z\s]/, "");
words = contents.gsub(/[^a-z'\s-]/, "").split

hash = Hash.new(0)

words.each do |word|
	hash[word] += 1
end

hash = hash.sort_by{|word, count| [-count, word]}

if ARGV[1] == 'json'
	jsonHash = {
		"marks" => marks.length,
		"words" => hash
	}
	puts jsonHash.to_json

elsif ARGV[1] == 'xml'
	xml = REXML::Document.new('')	
	mainTag = xml.add_element('word-counts')
	mainTag.add_element('marks').add_text marks.length.to_s
	wordsTag = mainTag.add_element('words')

	hash.each do |word, count|
		wordsTag.add_element('word', {'count' => count}).add_text word
	end

	formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(xml, $stdout)
else
	hash.each do |word, count|
		puts word + "," + count.to_s
	end

	if marks.length > 0
		puts '"marks",' + marks.length.to_s
	end
end