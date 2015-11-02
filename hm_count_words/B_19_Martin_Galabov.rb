require 'rexml/document'
require 'rubygems'
require 'json'
word_counter = {} 
command = ARGV[1] 
marks = 0
file = File.open(ARGV[0], "r")  
file.each_line do |line| 
  words = line.downcase.split  
  words.each do |word| 
  	marks += word.count(".,()!?_")
    word = word.gsub(/[,().!?_]/,'') 
    if word_counter.key?(word) 
      word_counter[word] += 1 
    else 
      word_counter[word] = 1 
    end 
  end 
end 
   
word_counter = word_counter.sort_by{|key, value|[-value, key]} 
if command == 'json'
if marks > 0
puts JSON.pretty_generate("marks" => marks,"words" => word_counter)
end
if marks == 0
puts JSON.pretty_generate("words" => word_counter)
end
end
if command == 'xml'
my_xml = REXML::Document.new('')
root = my_xml.add_element('word-counts')
root.add_element('marks').add_text"#{marks}"
words = root.add_element('words')
word_counter.each do |key,value|
word = words.add_element('word',{'count'=> "#{value}"})
word.add_text("#{key}")
end
formatter = REXML::Formatters::Pretty.new
formatter.compact = true
formatter.write(my_xml, $stdout)
else
word_counter.each do |key,value| 
   puts "#{key},#{value}"  
  end  
 	if marks > 0 then 
 	puts "\"marks\",#{marks}" 
 	end 
end




