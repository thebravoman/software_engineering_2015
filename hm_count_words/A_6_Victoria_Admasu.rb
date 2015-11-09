require 'json'
require 'rexml/document'

file = ARGV[0]
type = ARGV[1]
marks = 0
count = Hash.new
text = File.open(file, "r")

text.each_line { |line|
  words = line.downcase.split

  words.each { |word|
    marks += word.count("-_,.;:!?(){}")
    word = word.gsub(/[-_,.;:!?(){}]/, '')
    if count.has_key?(word)
      count[word] += 1
    else
      count[word] = 1
    end
  }
}

count = count.sort_by {|x, y| [-y, x]}

if type == 'json'
  j_count = {
    "marks" => marks,
    "words" => count 
  }
  
  puts JSON.pretty_generate(j_count)
elsif type == 'csv' or type == nil
  count.each { |x, y|
    puts "#{x},#{y}"
  }

  if marks > 0
    puts "\"marks\",#{marks}"
  end
elsif type == 'xml'
  x_count = REXML::Document.new

  num = x_count.add_element('counts')
  mark = num.add_element('marks')
  mark.add_text "#{marks}"
  x_words = num.add_element('words')

  count.each { |x, y|
    w = x_words.add_element('word')
    w.add_attribute('count', y)
    w.add_text "#{x}"
  }

  output = ''
  x_count.write(output, 1)

  puts output
end
