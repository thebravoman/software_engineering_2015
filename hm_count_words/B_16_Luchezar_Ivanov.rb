
require 'json'
require 'rexml/document'
require 'csv'

class Result

  attr_accessor :marks_count, :words_count
  
  def initialize
    @marks_count = 0
    @words_count = {}
  end

  def to_json
    @words_count['words'] = @words_count['words'].to_a
    puts JSON.pretty_generate(@words_count)
  end
  
  def to_xml
    xml_doc = REXML::Document.new
    tag = REXML::Element.new('word-counts')
    tag.add_element('marks').add_text("#{@marks_count}")
    tag.add_element('words')
    @words_count['words'].each do |word, count|
      tag.elements['words'].add_element('word', {'count' => count}).add_text(word)
    end
    xml_doc << tag
    output = ''
    printer = REXML::Formatters::Pretty.new(4)
    printer.compact = true
    printer.write(tag, output)
    puts output
  end
  
  def to_csv
    words_count['words'].to_a.each do |word, count|
      puts word + ",#{count}"
    end
    puts "\"marks\",#{@marks_count}" if @marks_count > 0
  end
end

class WordCounter
  public
    def parse_file(filename)
      parse(IO.read(filename).downcase)
    end
  
  private
    def mark_count(text)
      text.count(",.?!():;\"\'/-")
    end
  
    def split(text)
      text.gsub(/[^a-z\s]/, '').split(' ')
    end
  
    def sort(words)
      unique_text = words.uniq.sort do |a, b|
        if words.count(a) == words.count(b)
          a <=> b
        else
          words.count(b) <=> words.count(a)
        end
      end
      unique_text
    end
  
    def parse(string)
      res = Result.new
      res.marks_count = mark_count(string)
      string_split = split(string)
      sorted = sort(string_split)
      res.words_count['marks'] = res.marks_count
      res.words_count['words'] = {}
      sorted.each do |word|
        res.words_count['words'][word] = string_split.count(word)
      end
      res
    end  
end

result = WordCounter.new.parse_file(ARGV[0])


if ARGV[1] == 'json'
  result.to_json
elsif ARGV[1] == 'xml'
  result.to_xml
else
  result.to_csv
end
