require 'rexml/document'
require 'json'

@file_name = ARGV[0]
@option_type = ARGV[1]

class WordCounter
    private
    
    def parse(string)
        result = result.new
        result.marks_count = string.scan(/[,.!?:;"()\[\]]/).count
        file_text  = string.downcase.gsub(/[^a-z'\s-]/, '').split(' ')
        file_text.each do |word|
            word = word.downcase
            if result.word_counts.has_key?("#{word}")
                result.word_counts[word] += 1
            else
                result.word_counts[word] = 1
            end
        end
        result.word_counts = result.word_counts.sort_by {|word, count| [-count, word]}
        result
    end
    
    public
    def parse_file(file_name)
        text = ''
        File.open(file_name) do |file|
            file.each_line do |line|
                text += line
            end
        end
        
        parse text
    end
end
class Result
    private
    
    def xml_add(file)
        words = file.elements["word-count/words"]
        word_counts.each do |a, b|
            word = words.add_element 'word'
            word.add_attribute 'count' , b
            word_element.add_text "#{a}"
        end
    end
    
    public
    attr_accessor :marks_count
    attr_accessor :word_counts
    
    def initialize
        @marks_count = 0
        @word_counts = Hash.new 0
    end
    
    def to_xml
        file = REXML::Document.new('')
        word_counts = file.add_element('word-counts')
        xml_marks = word_counts.add_element('marks').add_text = "#{marks}"
        xml_words = word_counts.add_element('words')
        count_words.each do |a, b|
            word = xml_words.add_element('word', 'count' => b).text = "#{a}"
        end
        xml_add file
        file
    end
    def to_json
        json = { :marks => "#{marks}".to_i, :words => count_words, }
        JSON.pretty_generate(json)
    end
    def to_csv
        csv_file = []
        
        word_counts.each do |a, b|
            csv_file << a + ',' + b.to_s
        end
        if marks_count != 0
            csv_file << "\"marks\"," + marks_count.to_s
        end
    end
end
words = WordCounter.new
result = words.parse_file @file_name
 
if @option_type == 'xml'
    formatter = REXML::Formatters::Pretty.new
    formatter.compact = true
    formatter.write(result.to_xml, $stdout)
elsif @option_type == 'json'
    puts result.to_json
else
    puts result.to_csv
end
