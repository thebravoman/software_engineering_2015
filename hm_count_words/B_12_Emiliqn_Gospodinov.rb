require 'json'
require 'csv'
require 'rexml/document'

format = ARGV[1]

class Result
	
	def initialize
		@marks_count = 0
		@word_counts = {}
	end

	def setWordsMarks words, marks
    @word_counts = words
		@marks_count = marks
  end

	def to_csv
		@word_counts.each do |elements|
			puts "#{elements[0]},#{elements[1]}"
		end
		if @marks_count != 0
			puts '"marks",'+"#{@marks_count}"
		end
	end

	def to_json
		puts JSON.generate("marks" => @marks_count,"words" => @word_counts)
	end
	
	def to_xml
		my_xml = REXML::Document.new('')
		word = my_xml.add_element('word-counts')
		word.add_element('marks').add_text"#{@marks_count}"
		words_element = REXML::Element.new 'words'
		@word_counts.each do |k,v|
			words_element.add_element('word',{'count' => v}).add_text("#{k}")
		end
		word.add_element(words_element)
		puts my_xml
	end

end

class WordCounter
  private

  def parse(string)
		result = Result.new
		marks_counter = 0
		words = File.read(ARGV[0])
		h = Hash.new
    words.each_line do |line|
			wordz = line.downcase.split
			wordz.each do |word|
				marks_counter += word.scan(/[ ,().?!:; ]/).count
				word = word.gsub(/[ ,()'.?!:; ]/,'')
				if word!=''
					if h[word]
						h[word] += 1
		  		else
						h[word] = 1
		 			end
				end
			end
		end
		h = h.sort_by { |key, value| [ -value, key ] }
		result.setWordsMarks h, marks_counter
    result
  end

  public

  def parse_file(filename)
    text = ''

    File.open(filename) do |file|
      file.each_line do |line|
        text += line
      end
    end

    parse text
  end
end

word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]

if format == "json"
  puts result.to_json
elsif format == "xml"
  puts result.to_xml
elsif format == "csv" or format == nil
  puts result.to_csv
end
