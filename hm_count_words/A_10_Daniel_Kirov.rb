require 'json'
require 'rexml/document'

file_path = ARGV[0]
f = File.open(file_path, "r")
h = Hash.new(0)

marks_sum = 0

f.each_line do |line|
    marks_sum += line.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
    w = line.downcase.gsub(/[^a-z\n- ]/, ' ').split(" ")
    
    w.each do |words|
        
        h[words] += 1
    end 
end


h = h.sort_by{|words,number| words.downcase}
h = h.sort_by{|words,number| [-number,words]}

if ARGV[1] == "json"
  json_h = Hash.new(0)
  json_h["marks"] = marks_sum
  json_h["words"] = h
  puts json_h.to_json
  
elsif ARGV[1] == "xml"
    xml_ = REXML::Document.new('') 
    word_c_t = xml_.add_element('word-counts')
    word_c_t.add_element('marks').add_text marks_sum
    words_t = word_c_t.add_element('words')

    h.each do |word, count|
        words_t.add_element('word', {'count' => count}).add_text word
    end
    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(xml_, $stdout)

else
    h.each do |words, number|
        puts "#{words},#{number}"
    end
    if marks_sum!=0
        puts "\"marks\",#{marks_sum}"
    end
end

