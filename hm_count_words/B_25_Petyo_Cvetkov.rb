class CountWords
  def initialize #openFile
    #@text = 0#openFile
    @words_list = Hash.new(0)
    @marks = 0
  end
      def countWords
        fileName = File.open(ARGV[0] , "r")
        text = fileName.read.downcase


        @marks = text.scan(/[,.!?:;"()\[\]]/).count

        text = text.gsub(/[^a-z'\s-]/, '').split(" ")
        text.each do |word|
        #  if words_list.has_key?(word)
            @words_list[word]+=1
        #  else
        #    words_list[word] = 1
          end
        @words_list = @words_list.sort_by {|word, count| [-count, word]}
    end
end

class WriteLike < CountWords
  def likeCsv
    @words_list.each do |word,i|
  		puts "#{word},#{i}"
  	end
  	puts  "\"marks\",#{@marks}" if @marks != 0
  end

  def likeJson
    require 'json'
    my_json = {  :words => @words_list,:marks =>"#{@marks}".to_i  }
    puts JSON.pretty_generate(my_json)
  end

  def likeXml
    require 'rexml/document'
    xml_counts = REXML::Document.new("")
    xml_word_counts = xml_counts.add_element('word-counts')
    xml_marks = xml_word_counts.add_element('marks')
    xml_marks.add_text "#{@marks}"
    xml_words = xml_word_counts.add_element('words')
    @words_list.each do |index, key|
      word = xml_words.add_element('word')
      word.add_attribute( 'count', key)
      word.add_text "#{index}"
    end
    out = ""
    xml_counts.write(out, 1)
    puts out
  end
end


class Casse < WriteLike

  def casse
    case ARGV[1]
    when "csv" then likeCsv
    when "json" then likeJson
    when "xml" then likeXml
    else likeCsv
    end
  end
end
clazz = Casse.new
clazz.countWords
clazz.casse
