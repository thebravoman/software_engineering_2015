require 'rexml/document'
require 'rexml/element'
require 'json'
require 'csv'

result = Hash.new
words = File.read(ARGV[0])
my_xml = REXML::Document.new('')
marks_counter = 0
marks_pat = /[\p{P}\p{S}]/u

words.each_line do |line|
	line.downcase.scan(/\b[A-Za-z0-9]+\b/i).each do |word|
		marks_counter += word.count(".,!?()[]\"")
		word = word.gsub(/[,()!.?_"]/,'')
			if result.has_key?(word)
				result[word]+=1
			else
				result[word] = 1
			end
	end

	line.downcase.scan(marks_pat)
.each { marks_counter += 1 }

end
result=result.sort_by{|k,v| [-v,k]}

if ARGV[1] == 'csv' or ARGV[1] == nil
	result.each do |elements|
		puts "#{elements[0]},#{elements[1]}"
	end
	if marks_counter!=0
		puts '"marks",'+"#{marks_counter}"
	end
	CSV.open("result.csv", "w") do |csv|
  	result.each {|element| csv << element}
	end

elsif ARGV[1] == 'json'
	puts JSON.pretty_generate("marks" => marks_counter,"words" => result.to_a)
elsif ARGV[1] == 'xml'
	word = my_xml.add_element('word-counts')
	word.add_element('marks').add_text"#{marks_counter}"
	words_element = REXML::Element.new 'words'
	result.each do |k,v|
		words_element.add_element('word',{'count' => v}).add_text("#{k}")
	end
	word.add_element(words_element)
	puts my_xml
end
