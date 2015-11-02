require 'csv'
require 'json'
require 'rexml/document'

file = File.open(ARGV[0])#opens the file
command = ARGV[1]
content = String.new #declaring "content"- string
marks=0#declaring the counter for the marks in the text
count = Hash.new(0)#creates new Hash for counting words
content = file.read#reading the file into the string
content=content.downcase#downcasing all the words
content=content.split(" ")#spliting the string into words
content.each do |word|#counting the words 
	marks += word.count(". , ! ? : ; -  _ ' \"[ ] ( ) „ “ * / \ ")#counting the marks in every word
	word =word.gsub(/[,()'"„“.*!?:;]/, '')
	count[word] += 1
end
count = count.sort_by{|word,num| word.downcase}#sorting alphabetically
count = count.sort_by {|word,num| [-num,word]}#sorting by the counter
count.each do|word, num|
	
	puts word+','+num.to_s
end
if marks!=0
	puts '"marks"'+','+marks.to_s
	end
	
if command == "json"

json_hash = {
		"marks"=>marks,
		"words"=>count
}
json_hash2= JSON.pretty_generate(json_hash)

File.open('result.json', 'w') do |f|
		f << json_hash2
		end
		
elsif command == "xml"
  xml_new = REXML::Document.new('')
  
  word_counts = xml_new.add_element('word-counts')
  xml_mrks =word_counts.add_element('marks')
  xml_mrks.add_text "#{marks}"
  xml_words = word_counts.add_element('words')

  count.each do |word, count|
    word = xml_words.add_element('word', 'count' => count).text = "#{word}"
  end

  formatter = REXML::Formatters::Pretty.new
  formatter.compact = true
	File.open('result.xml', 'w') do |f|
		f << xml_new
	end
else
	CSV.open('result.csv', 'w') do |csv|
		count.each do |elem|
			csv << elem
		end
		if marks != 0
			csv <<  '"marks"'+','+marks.to_s
		end
	end
end

