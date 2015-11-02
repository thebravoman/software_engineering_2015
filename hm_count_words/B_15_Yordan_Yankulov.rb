require 'json'
require 'rexml/document'

txt_file = File.open(ARGV[0],"r")
command = ARGV[1]
help = Hash.new
punctuation = 0
txt_file.each_line{ |line|
	the_words = line.downcase.split
	the_words.each { |words|
	punctuation += words.count(".,!?:;-_'\"[]()„“*/\ ")
	words = words.gsub(/[,()!.?_"]/,'')
	if help.has_key?(words)
		help[words] = help[words] + 1
	else
		help[words] = 1
	end
	}
}
if command == 'json'
	help = help.sort {|first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1])}
	if punctuation != 0
		puts JSON.pretty_generate("marks" => punctuation,"words" => help)
	else
		puts JSON.generate("words" => help)
	end

elsif command == 'xml'
		help = help.sort {|first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1])}
		my_xml = REXML::Document.new('')
		word_counts = my_xml.add_element('word-counts')
		if punctuation != 0
			word_counts.add_element('marks').add_text"#{punctuation}"
		end
		words = word_counts.add_element('words')
		help.each do |key,count|
		word = words.add_element('word', {'count' => "#{count}"}).add_text"#{key}"
	end
	formatter = REXML::Formatters::Pretty.new
	formatter.compact = true
	formatter.write(my_xml, $stdout)

else
	help = help.sort! {|first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1])}.each { |element|
	puts "#{element[0]},#{element[1]}"
	}
	if punctuation!=0
		puts "\"marks\", #{punctuation}"
	end
end
