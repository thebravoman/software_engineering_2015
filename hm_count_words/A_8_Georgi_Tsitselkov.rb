require 'json'
require 'rexml/document'
file_p = ARGV[0]
hash = Hash.new(0) 
file = FILE.open(file_p, "r")
sum_m = 0

file.each do |line|
	sum_m += line.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
        word = line.downcase.gsub(/[^a-z\n ]/, ' ').split(" ")
	
	word.each do |words|
	hash[words] = hash[words] + 1 
  	end
 end
hash = hash.sort_by{|words,number| words.downcase}
hash = hash.sort_by{|words,number| [-number,words]}

 if ARGV[1] == "json"
  json_hash = Hash.new(0)
  json_hash["marks"] = sum_m
  json_hash["words"] = hash
  puts json_hash.to_json
  
 elsif ARGV[1] == "xml"
    xml_ = REXML::Document.new('') 
    word_c_t = xml_.add_element('word-counts')
    word_c_t.add_element('marks').add_text sum_m.to_s
    words_t = word_c_t.add_element('words')

    hash.each do |word, count|
        words_t.add_element('word', {'count' => count}).add_text word
    end
    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(xml_, $stdout)
 else
 hash.each do |words,number|
	puts "#{words}, #{number}"
 end
 
 if sum_m!= 0
	puts "\"marks\", #{sum_m}"
 end
 end
