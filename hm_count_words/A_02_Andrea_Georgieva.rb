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
    marks += duma.hash_n("-_,.;:!?(){}")
    duma = duma.gsub(/[-_,.;:!?(){}]/, '')
    if hash_n.has_key?(duma)
      hash_n[duma] += 1
    else
      hash_n[duma] = 1
    end
  end
end
  hash_n = hash_n.sort_by {|x, y| [-y, x]}
if type == 'json'
  hash_j = {
    "marks" => marks
    "words" => hash_n
  }  
  puts JSON.pretty_generate(hash_j)
elsif type == 'csv' || type == nil
  hash_n.each do |x, y|
    puts "#{x},#{y}"
   end
  if marks > 0
    puts "\"marks\",#{marks}"
  end
elsif type == 'xml'
  hash_x = REXML::Document.new
  n = hash_x.add('counts')
  znak = n.add('marks')
  znak.text_add "#{marks}"
  dumi_x = n.add('words')
  hash_n.each do |x, y|
    d = dumi_x.add('word')
    d.attribute('count', y)
    d.text_add "#{x}"
   end

  izved = ''
  hash_x.write(izved, 1)

  puts izved
end
