require 'rexml/document'
require 'json'

file = ARGV[0]
tip = ARGV[1]
$hash_n = Hash.new
$marks = 0
class CountingWords
def parse_s(str)
res = Result.new
str = str.downcase.split

str.each_line do |line|
  dumi = line.downcase.split
  dumi.each do |duma|
    $marks += duma.$hash_n("-_,.;:!?(){}")
    duma = duma.gsub(/[-_,.;:!?(){}]/, '')
    if $hash_n.has_key?(duma)
      $hash_n[duma] += 1
    else
      $hash_n[duma] = 1
    end
  end
end
  $hash_n = $hash_n.sort_by {|x, y| [-y, x]}
 res.inititalize($hash_n, $marks)
end


 def parse_file(file)
    file = File.open file
    text = ''

    file.each_line { |line|
      text += line
    }

    parse_s(text)
  end
end

class Res
  @marks_b = 0
  @word_broi = Hash.new

  def inititalize(count, marks)
     @word_broi = count
    @marks_b = marks
  end

  def marks_b
    @marks_b
  end

  def word_broi
     @word_broi
  end
  
  def json_
    j_broi = {
      "marks" => @marks_b,
      "words" =>  @word_broi
    }

    puts JSON.generate(hash_j)
  end

  def csv_
     @word_broi.each do |x, y|
      puts "#{x},#{y}"
    end

    if @marks_b > 0
      puts "\"marks\",#{@marks_b}"
    end
  end

  def xml_
    hash_x = REXML::Document.new
    
    num =  hash_x.add_el('counts')
    znak = num.add_el('marks')
    znak.text_add "#{@marks_b}"
    dumi_x = num.add_el('words')

     @word_broi.each { |x, y|
      w = dumi_x.add_ele('word')
      w.attribute('count', y)
      w.text_add "#{x}"
    }

    out = ''
     hash_x.write(out, 1)

    puts output
  end
end


word_broqch = WordCounter.new

result = word_broqch.parse_file file

if tip == 'json'
  puts res.json_
elsif tip == 'csv' or tip == nil
  puts res.csv_
elsif tip == 'xml'
  puts res.xml_
end
