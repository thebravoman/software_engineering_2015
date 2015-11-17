require 'json'
require 'rexml/document'

class Result
  def initialize number4e, hash4e
  @mark_count = number4e
  @word_counts = hash4e
  end 
  
  def to_json
    json_h = Hash.new(0)
    json_h["marks"] = @mark_count
    json_h["words"] = @word_counts
    puts json_h.to_json
  end
  
  def to_xml
    xml_ = REXML::Document.new('') 
    word_c_t = xml_.add_element('word-counts')
    word_c_t.add_element('marks').add_text @mark_count.to_s
    words_t = word_c_t.add_element('words')

    @word_counts.each do |word, count|
        words_t.add_element('word', {'count' => count}).add_text word
    end
    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(xml_, $stdout)
  end
  
  def to_csv
    @word_counts.each do |words, number|
        puts "#{words},#{number}"
    end
    if @mark_count!=0
        puts "\"marks\",#{@mark_count}"
    end
  end
  
end


class WordCounter
  def parse file
    h = Hash.new(0)
    marks_sum = file.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
    w = file.downcase.gsub(/[^a-z\n- ]/, ' ').split(" ") 
    w.each do |words|
      h[words] += 1
    end
    
    h = h.sort_by{|words,number| words.downcase}
    h = h.sort_by{|words,number| [-number,words]}
    return Result.new marks_sum, h
  end
  
  def parse_file filename
    string4e = ""
    f = File.open(filename, "r")
    string4e = f.read
    return parse string4e
  end
end

file_path = ARGV[0]
res  = (WordCounter.new).parse_file(file_path)

if ARGV[1] == "json"
  res.to_json
elsif ARGV[1] == "xml"
  res.to_xml
else
  res.to_csv
end
