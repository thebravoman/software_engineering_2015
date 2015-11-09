#!/usr/bin/ruby

require 'json'
require 'rexml/document'
require 'csv'

class WordCounter

  def parse_file(path)

	_path = path
    result = []
	words = Hash.new
	file = File.open(_path, "r")

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

    parsed_result = Result.new(words,marks)
    return parsed_result
 
  end

  def parse(string)
    words = Hash.new	
    marks = string.count("()-=_+*.,?!/|:;><&%$#@!`~")
    string = string.downcase.split(" ")
    
    string.each do |word|
      word = word.gsub(/[,()'".=-_*&^%$#@!`~+;:<>]/,'')
	  if words[word]
		words[word] += 1
	  else
		words[word] = 1
      end
    end

    words = words.sort_by{|word,occ| word.downcase}	
	words = words.sort_by{|word,occ| [-occ,word]}	 

    parsed_result = Result.new(words,marks)
    return parsed_result
  end

end

class Result

  def initialize(words, marks)
    @words = words
    @marks = marks  
  end

  def to_csv
    @words.each do |word,occ|	
	   puts	word + ',' + occ.to_s
    end
	  
    if @marks != 0
       "\"marks\",#{@marks}"
	end
  end

  def to_json
    b = Hash[@words.map {|key,value| [key,value]}]
	my_json = JSON.pretty_generate({marks: @marks, words: [b]})
  end
 
  def to_xml
    doc = REXML::Document.new('')
	  
	word_counts = doc.add_element('word-counts')
	marks = word_counts.add_element('marks').text = "#{@marks}"
	wordz = word_counts.add_element('words')
  
    @words.each do |index, key|
	  word = wordz.add_element('word', 'count' => "#{key}").text = "#{index}"
	end

	formatter = REXML::Formatters::Pretty.new
	formatter.compact = true
	formatter.write(doc, $stdout)

    p    
  
  end

  def marks_count
    @marks
  end

  def word_counts
    @words.each do |word, occ|
      puts "#{word},#{occ}"
    end
    p 
  end

end

  path = ARGV[0]
  format = ARGV[1]

  wc = WordCounter.new
  #result = wc.parse_file(path)
  result = wc.parse("This is an a a a, example sentence!")
  if format == "xml"
    puts result.to_xml
  elsif format == "json"
    puts result.to_json
  else
    puts result.to_csv
  end
