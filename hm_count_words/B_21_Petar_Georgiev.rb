require 'csv'
require 'rexml/document'
require 'json'

count_words = Hash.new(0)
file = File.new(ARGV[0], "r")
marks = 0
option_type = ARGV[1]
#GSUB FAILED
while (line = file.gets)
  line.each_char { |character|
    if character.match(/[[:punct:]]/)
      marks = marks + 1
    end
  }
  text = line.split(/\W+/)
  text.each { |word|
    word = word.downcase
    if count_words.has_key?("#{word}")
      count_words[word] += 1
    else
      count_words[word] = 1
    end
  }
end
count_words = count_words.sort_by {|word, count| [-count, word]}

if option_type == "xml"
  file = REXML::Document.new('')
  word_counts = file.add_element('word-counts')
  xml_marks = word_counts.add_element('marks').text = "#{marks}"
  xml_words = word_counts.add_element('words')
  count_words.each do |a, b|
    word = xml_words.add_element('word', 'count' => b).text = "#{a}"
  end
  formatter = REXML::Formatters::Pretty.new
  formatter.compact = true
  formatter.write(file, $stdout)
  puts
elsif option_type == "json"
  json = { :marks => "#{marks}".to_i, :words => count_words, }
  puts JSON.pretty_generate(json)
else
  count_words.each do |word,count|	
    puts word + ',' + count.to_s
  end
  if marks != 0
    puts "\"marks\",#{marks}"
  end
end
