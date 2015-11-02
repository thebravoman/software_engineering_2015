output_format = ARGV[1]

  str = {}
  marks = 0
  
file = File.open(ARGV[0], "r")
file.each_line do |line|
  contents = line.downcase.split(/\s([^\,\.\'\"\?\!\-\_\;\:\/\s]*)/)
  contents.each do |index|
    marks += index.count(". ? ! : ; - _ ( ) [ ] ' , \" * ^ \ / " ,)
    index = index.gsub(/[,.()"?!';:-_^]/, "")
  
    if str[index] 
      str[index] += 1
    else
      str[index] = 1
    end
      
  end
end

  str = str.sort_by{|index,key| index}
  str = str.sort_by {|index,key| [-key,index]}

  str.shift
  
def csv_format word_counter, marks

  word_counter.each do|index, key|	
    puts "#{index},#{key.to_s}"

  end

  if marks != 0
    puts "\"marks\","+"#{marks}"
  end
end



def json_format word_counter, marks
  require 'json'

  my_json = { :marks => "#{marks}".to_i, :words => word_counter, }
  puts JSON.pretty_generate(my_json)

end



def xml_format word_counter, marks
  require 'rexml/document'
  
  xml_counts = REXML::Document.new("")
  
  xml_word_counts = xml_counts.add_element('word-counts')
  
  xml_marks = xml_word_counts.add_element('marks')
  xml_marks.add_text "#{marks}"
  
  xml_words = xml_word_counts.add_element('words')
  
  word_counter.each do |index, key|
    word = xml_words.add_element('word')
    word.add_attribute( 'count', key)
    
    word.add_text "#{index}"
  end
  
  out = ""
  xml_counts.write(out, 1)
  puts out
  
end



if output_format == 'csv' || output_format == nil
  csv_format(str, marks)

elsif output_format == 'json'
  json_format(str, marks)
  
elsif output_format == 'xml'
  xml_format(str, marks)

else csv_format(str, marks)
end
