require 'json'
require 'builder'

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
	p JSON.pretty_generate(jsonHash)

elsif ARGV[1] == 'xml'
	xml = Builder::XmlMarkup.new(:indent => 4)
	puts xml.word-counts {
	  xml.makrs marks.length
	  xml.words{
	  	hash.each do |word, count|
			xml.word(count: count)
		end
	  }
	}
else
	hash.each do |word, count|
		puts word + "," + count.to_s
	end

	if marks.length > 0
		puts '"marks",' + marks.length.to_s
	end
end