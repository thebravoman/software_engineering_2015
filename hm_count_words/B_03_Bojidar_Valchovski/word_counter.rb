#!/usr/bin/ruby
require 'json'
require 'rexml/document'
require 'csv'

class WordCounter

  def parse_file(path)

	_path = path

  	result = ''
	file = File.open(_path)
	file.each_line do |line|
		result += line
	end

	words = Hash.new

	marks = result.count("[]!@#$%^&*()_+-=':\"|,.<>/?")
	result = result.gsub(/[^A-Za-z]/, ' ').downcase
	result = result.split(" ")

	result.each do |word|
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
      word = word.gsub(/[\p{P}_]/,'')
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

  def parse_script(path)
	_path = path

	words = Hash.new
	marks = 0
	
	file = File.open(_path, "r")
	wordslist = file.read.downcase
	wordslist.scan(/[\p{P}\p{S}]/).each { marks += 1 }
	wordslist = wordslist.gsub(/[^A-Za-z0-9]/, ' ')
	wordslist = wordslist.gsub("-", ' ')
	wordslist = wordslist.split(" ")

	wordslist.each do |word|
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
