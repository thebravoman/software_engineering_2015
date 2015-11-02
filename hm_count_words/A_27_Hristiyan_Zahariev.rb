require 'json'
require 'rexml/document'

mode = "r+"
filepath = ARGV[0]
filename = File.open(filepath, mode)

json_xml = ARGV[1]

wordsnum = Hash.new(0)
markz_count = 0


filename.each_line do |line|
    w = line.downcase.split(" ") 
    w.each do |word|
	markz_count = markz_count + word.count(": ; * = +  [ „ ] - _ ' \ /“ ( ) . , ! ? ")
	word = word.gsub(/[, . ( ) " * ' ; : - _ ^ ! ? ]/, "")
	wordsnum[word] = wordsnum[word] + 1
    end
end
 
wordsnum = wordsnum.sort_by{|word, number| word.downcase}
wordsnum = wordsnum.sort_by{|word, number| [-number,word]}

wordsnum.each do |word, number|
   puts word + ',' + number.to_s
end
if markz_count != 0
   puts '"marks"'+','+markz_count.to_s
end

if json_xml == "json"
  tempHash = {
    "marks" => markz_count,
    "words" => wordsnum
  }
  puts JSON.pretty_generate(tempHash)
end

if json_xml == "xml"
  xml_counts = REXML::Document.new("")
  xml_word_counts = xml_counts.add_element("word-counts")
  xml_marks = xml_word_counts.add_element("marks")
  xml_marks.add_text "#{markz_count}"
  xml_words = xml_word_counts.add_element("words")
  wordsnum.each do |index, key|
    word = xml_words.add_element('word')
    word.add_attribute("count", 'key.to_s')
    word.add_text "#{index}"
  end
  xmlprint = ""
  xml_counts.write(xmlprint, 4)
  puts xmlprint
end
