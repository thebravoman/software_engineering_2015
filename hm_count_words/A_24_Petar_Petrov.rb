require 'json'
require 'pp'
require 'rexml/document'
require 'neatjson'

text = IO.read(ARGV[0]).downcase
marks = text.count(",.?!():;\"\'/-")
words = text.gsub(/[^a-z\s]/, '').split(' ')
unique_text = words.uniq.sort do |a, b|
  if words.count(a) == words.count(b)
    a <=> b
  else
    words.count(b) <=> words.count(a)
  end
end
if ARGV[1] == 'json'
  my_hash = {}
  my_hash['marks'] = marks
  my_hash['words'] = {}
  unique_text.each do |word|
    my_hash['words'][word] = words.count(word)
  end
  my_hash['words'] = my_hash['words'].to_a
  puts JSON.neat_generate(my_hash, wrap: 40, after_colon: 1, after_comma: 1, indent: '    ')
elsif ARGV[1] == 'xml'
  xml_doc = REXML::Document.new
  tag = REXML::Element.new('word-counts')
  tag.add_element('marks').add_text("#{marks}")
  tag.add_element('words')
  unique_text.each do |word|
    tag.elements['words'].add_element('word')
    tag.elements['word'].add_attribute('count', words.count(word))
    tag.elements['word'].add_text(word)
  end
  xml_doc << tag
  output = ''
  printer = REXML::Formatters::Pretty.new(4)
  printer.compact = true
  printer.write(xml_doc, output)
  puts output
else
  unique_text.each do |word|
    word_count = words.count(word)
    puts word + ",#{word_count}"
  end
  puts "\"marks\",#{marks}" if marks > 0
end
