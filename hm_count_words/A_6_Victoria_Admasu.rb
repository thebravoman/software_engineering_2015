require 'json'
require 'rexml/document'
require './A_6_Victoria_Admasu/word_counter'

name = ARGV[0]
type = ARGV[1]
$marks = 0
$count = Hash.new

p1 = name.split('/').first

if p1 == 'http:' || p1 == 'https:'
  result = WordCounter.parse_web(name)
else 
  result = WordCounter.parse_file(name)
end

=begin
class WordCounter
  def parse(string)
    result = Result.new
    string = string.downcase.split

    string.each { |word|
      $marks += word.count("-_,.;:!?(){}")
      word = word.gsub(/[-_,.;:!?(){}]/, '')
      if $count.has_key?(word)
        $count[word] += 1
      else
        $count[word] = 1
      end
    } 

    $count = $count.sort_by {|x, y| [-y, x]}

    result.inititalize($count, $marks)
    result
  end

  def parse_file(filename)
    file = File.open filename
    text = ''

    file.each_line { |line|
      text += line
    }

    parse(text)
  end
end

class Result
  @marks_count = 0
  @word_counts = Hash.new

  def inititalize(count, marks)
    @word_counts = count
    @marks_count = marks
  end

  def marks_count
    @marks_count
  end

  def word_counts
    @word_counts
  end
  
  def to_json
    j_count = {
      "marks" => @marks_count,
      "words" => @word_counts 
    }

    puts JSON.pretty_generate(j_count)
  end

  def to_csv
    @word_counts.each { |x, y|
      puts "#{x},#{y}"
    }

    if @marks_count > 0
      puts "\"marks\",#{@marks_count}"
    end
  end

  def to_xml
    x_count = REXML::Document.new
    
    num = x_count.add_element('counts')
    mark = num.add_element('marks')
    mark.add_text "#{@marks_count}"
    x_words = num.add_element('words')

    @word_counts.each { |x, y|
      w = x_words.add_element('word')
      w.add_attribute('count', y)
      w.add_text "#{x}"
    }

    output = ''
    x_count.write(output, 1)

    puts output
  end
end

#main
word_counter = WordCounter.new

result = word_counter.parse_file filename
=end

if type == 'json'
  result.to_json
elsif type == 'csv' or type == nil
  result.to_csv
elsif type == 'xml'
  result.to_xml
end
