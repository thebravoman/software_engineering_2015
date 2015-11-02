require 'csv'
require 'json'
require 'rexml/document'

f_name = ARGV[0].to_s
option = ARGV[1]

File.open(f_name) do |file|
  text = ''
  
  file.each_line do |line|
    text += line
  end

  marks_c = text.scan(/[,.!?:;"()\[\]]/).count
  words = text.downcase.gsub(/[^a-z'\s-]/, '').split(' ')
  c_words = Hash.new(0)

  words.each do |word|
    c_words[word] += 1
  end

  c_words = c_words.sort_by { |word, count| [-count, word] }
  
  if(option == 'json')
    json_output = { marks: marks_c, words: c_words }
	puts JSON.pretty_generate(json_output)
  elsif(option == 'xml')
    document = REXML::Document.new
	word_c = document.add_element 'word-counts'
	word_c.add_element('marks').add_text("#{marks_c}")
	words = word_c.add_element 'words'
	
	c_words.each do |word, count|
		words.add_element('word').add_attribute('count', count).add_text(word)
	end

	output = ''
	document.write(out, 1)
	puts output
  else
    c_words.each { |word, count| puts word + ',' + count.to_s }
	puts "\"marks\"," + marks_c.to_s
  end
  
end
