require 'csv'
require 'json'
require 'rexml/document'

@input_file = ARGV[0]
@output_format = ARGV[1]

def output_csv counted_words, marks_count
  counted_words.each { |word, count| puts word + "," + count.to_s }
  puts "\"marks\"," + marks_count.to_s
end

def output_json counted_words, marks_count
  json_output = { :marks => marks_count, :words => counted_words }
  puts JSON.pretty_generate(json_output)
end

def output_xml counted_words, marks_count
  document = REXML::Document.new
  word_counts = document.add_element 'word-counts'
  marks = word_counts.add_element 'marks'
  marks.add_text "#{marks_count}"
  words = word_counts.add_element 'words'

  counted_words.each do |word, count|
    word_element = words.add_element 'word'
    word_element.add_attribute 'count', count
    word_element.add_text word
  end

  out = ""
  document.write(out, 1)
  puts out
end

File.open(@input_file) do |file|
  text = ''

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

  if @output_format == "json"
    output_json counted_words, marks_count
  elsif @output_format == "xml"
    output_xml counted_words, marks_count
  else
    output_csv counted_words, marks_count
  end
end
