require 'json'
require 'rexml/document'

words = Hash.new(0)
total_marks_count = 0

file_path = ARGV[0]
format = ARGV[1] == nil ? 'csv' : ARGV[1].downcase

File.open(file_path, "r") do |f|
  f.each_line do |line|
    current_line_words = line.downcase.scan(/\w+/)
    current_line_words.each do |word|
      words[word] += 1
    end
    total_marks_count += line.scan(/[[:punct:]]/).count
  end
end

# http://stackoverflow.com/a/4425338/2685732
sorted_words = words.sort_by { |word, occurences| [-occurences, word] }

case format
when 'json'
  hash_format = {
    "marks" => total_marks_count,
    "words" => sorted_words
  }

  puts JSON.pretty_generate(hash_format)
when 'xml'
  doc = REXML::Document.new
  doc.context[:attribute_quote] = :quote
  word_counts_element = doc.add_element('word-counts')

  marks_element = word_counts_element.add_element('marks')
  marks_element.add_text(total_marks_count.to_s)

  words_element = word_counts_element.add_element('words')

  sorted_words.each do |word, count|
    word_element = words_element.add_element('word')
    word_element.add_attributes({"count" => count.to_s })
    word_element.add_text(word)
  end

  formatter = REXML::Formatters::Pretty.new(4)
  formatter.compact = true
  res = ''
  formatter.write(doc, res) # TODO: Find out how to write to $stdout with \n
  puts res
else
  sorted_words.each do |word, occurences|
    puts "#{word},#{occurences}"
  end

  if total_marks_count > 0
    puts "\"marks\",#{total_marks_count}"
  end
end
