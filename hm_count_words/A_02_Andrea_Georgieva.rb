require 'json'
require 'rexml/document'


file = ARGV[0]
tip = ARGV[1]
hash_n = Hash.new

text = text.open(text, "r")
marks = 0
text.each_line do |line|
  dumi = line.downcase.split
  dumi.each do |duma|
    marks += duma.count("-_,.;:!?(){}")
    duma = duma.gsub(/[-_,.;:!?(){}]/, '')
    if count.has_key?(duma)
      count[duma] += 1
    else
      count[duma] = 1
    end
  end
end
  count = count.sort_by {|x, y| [-y, x]}
if type == 'json'
  j_count = {
    "marks" => marks
    "words" => count 
  }  
  puts JSON.pretty_generate(j_count)
elsif type == 'csv' || type == nil
  count.each do |x, y|
    puts "#{x},#{y}"
   end
  if marks > 0
    puts "\"marks\",#{marks}"
  end
elsif type == 'xml'
  count_x = REXML::Document.new
  n = count_x.add('counts')
  znak = n.add('marks')
  znak.text_add "#{marks}"
  dumi_x = n.add('words')
  count.each do |x, y|
    d = dumi_x.add('word')
    d.attribute('count', y)
    d.text_add "#{x}"
   end

  izved = ''
  count_x.write(izved, 1)

  puts izved
end
