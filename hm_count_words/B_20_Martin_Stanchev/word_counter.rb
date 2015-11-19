class WordCounter
  def parse (file_path)
    str_res = Result.new 
    marks = 0

    file = File.open(ARGV[0], "r")
    contents = file.read.downcase.split(" ")
    
    contents.each do |index|
      str_res.marks += index.count('^a-zA-Z0-9')
      index = index.tr('^A-Za-z', ' ')
      index = index.gsub(/\s/, '')
      #index = index.delete('^a-zA-Z')
      
      if str_res.str[index] 
        str_res.str[index] += 1
      else
        str_res.str[index] = 1
      end
    end

    str_res.str = str_res.str.sort_by{|index,key| index}
    str_res.str = str_res.str.sort_by {|index,key| [-key,index]}
        
    str_res.str.shift
        
    str_res
  end
end


class Result
  
  attr_accessor :str
  attr_accessor :marks
  
  def initialize
    @str = Hash.new
    @marks = 0
  end
  
  
  def csv_format
    str.each do|index, key|
      puts index + ',' + key.to_s 
    end

    if marks != 0
      puts "\"marks\"," + marks.to_s
    end
  end

  
  def json_format
    require 'json'

    my_json = { :marks => "#{marks}".to_i, :words => str, }
    puts JSON.pretty_generate(my_json)

  end

  
  def xml_format
    require 'rexml/document'
    
    xml_counts = REXML::Document.new("")
    
    xml_word_counts = xml_counts.add_element('word-counts')
    
    xml_marks = xml_word_counts.add_element('marks')
    xml_marks.add_text "#{marks}"
    
    xml_words = xml_word_counts.add_element('words')
    
    str.each do |index, key|
      word = xml_words.add_element('word')
      word.add_attribute( 'count', key)
      
      word.add_text "#{index}"
    end
    
    out = ""
    xml_counts.write(out, 1)
    puts out
    
  end
end