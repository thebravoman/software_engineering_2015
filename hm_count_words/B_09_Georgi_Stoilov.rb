require 'json'
require 'rexml/document'

word_counter = {}
marks = 0
w_count = Hash.new(0)
file = File.open(ARGV[0], 'r')
format = ARGV[1]
file.each_line do |line|
  marks = line.scan(/[,.!?()":\[\];]/).count
  word = line.downcase.split
  word.each do |word|
    word = word.gsub(/[,.!?()":\[\];]/, '')
    if word_counter.key?(word)
      word_counter[word] += 1
    else
      word_counter[word] = 1
    end
  end
end
if format == 'csv' || format == nil
  sorted_array = word_counter.sort_by { |key, value| [-value, key] }
  sorted_array.each do |key, value|
    puts "#{key},#{value}"
  end
  if marks != 0
    puts "\"marks\",#{marks}"
  end
  else
  if format == 'json'
    sorted_array = word_counter.sort_by { |key, value| [-value, key] }
    json = { 'marks' => marks, 'words' => sorted_array }
    puts JSON.pretty_generate(json)
    else
    if format == 'xml'
      sorted_array = word_counter.sort_by { |key, value| [-value, key] }
      formatter = REXML::Formatters::Pretty.new
      my_xml = REXML::Document.new('')
      words_counter = my_xml.add_element('words-counter')
      marks = words_counter.add_element('marks').add_text "#{marks}"
      words = words_counter.add_element('words')
      sorted_array.each do |key, value|
        words.add_element('word', 'count' => value).add_text "#{key}"
      end
      formatter.compact = true
      formatter.write(my_xml, $stdout)
      puts
    end
  end
end
