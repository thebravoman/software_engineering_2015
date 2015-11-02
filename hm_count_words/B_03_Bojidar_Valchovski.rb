#!/usr/bin/ruby

require 'json'
require 'rexml/document'
require 'csv'

path = ARGV[0]
format = ARGV[1]
words = Hash.new
marks = Hash.new
file = File.open(path, "r")

wordslist = file.read.downcase
marks = wordslist.count("()-=_+*.,?!/|:;><&%$#@!`~")
wordslist = wordslist.split(" ")	
wordslist.each do |word|
  word = word.gsub(/[,()'".=-_*&^%$#@!`~+;:<>]/,'')
  if words[word]
    words[word] += 1
  else
	words[word] = 1
  end
end

words = words.sort_by{|word,occ| word.downcase}	
words = words.sort_by{|word,occ| [-occ,word]}	 

if format == "csv"
  words.each do |word,occ|	
    puts word + ',' + occ.to_s
  end
  
  if marks != 0
    puts "\"marks\",#{marks}"
  end

elsif format == "json"
  b = Hash[words.map {|key,value| [key,value]}]
  puts JSON.pretty_generate({marks: marks, words: [b]})

elsif format == "xml"
  doc = REXML::Document.new('')
  
  word_counts = doc.add_element('word-counts')
  marks = word_counts.add_element('marks').text = "#{marks}"
  wordz = word_counts.add_element('words')

  words.each do |index, key|
    word = wordz.add_element('word', 'count' => key).text = "#{index}"
  end

  formatter = REXML::Formatters::Pretty.new
  formatter.compact = true
  formatter.write(doc, $stdout)
  
  puts
end
