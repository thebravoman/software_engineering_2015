require 'json'
require 'rexml/document'

file_name = ARGV[0]
format_of_output = ARGV[1]

class WordCounter

	def parse(string)
      help = Hash.new
      punctuation = 0
      string.each_line{ |line|
      the_words = line.downcase.split
      the_words.each { |words|
        punctuation += words.count(".,!?:;-_'\"[]()„“*/\ ")
        words = words.gsub(/[,()!.?_"]/,'')
        if help.has_key?(words)
          help[words] = help[words] + 1
        else
          help[words] = 1
        end
      }
      my_help = help.sort {|first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1])}
      return Result.new(punctuation, my_help)
    }
	end
	def parse_file(filename)
    result = File.open(filename,"r")
    result = result.read
    parse result
	end
end

class Result

  def initialize punct, helpe
    @punctuation = punct
    @help = helpe
  end
	def to_csv
    @help.each{ |element|
  	puts "#{element[0]},#{element[1]}"
  	}
  	if @punctuation!=0
  		puts "\"marks\", #{@punctuation}"
  	end
	end

	def to_json
  	if @punctuation != 0
  		puts JSON.pretty_generate("marks" => @punctuation,"words" => @help)
  	else
  		puts JSON.pretty_generate("words" => @help)
  	end
	end

	def to_xml
		my_xml = REXML::Document.new('')
		word_counts = my_xml.add_element('word-counts')
		if @punctuation != 0
			word_counts.add_element('marks').add_text"#{@punctuation}"
		end
		words = word_counts.add_element('words')
		@help.each do |key,count|
		word = words.add_element('word', {'count' => "#{count}"}).add_text"#{key}"
	end
	formatter = REXML::Formatters::Pretty.new
	formatter.compact = true
	formatter.write(my_xml, $stdout)
	end
end

word_counter = WordCounter.new
result = word_counter.parse_file file_name

if format_of_output == 'json'
  puts result.to_json
elsif format_of_output == 'xml'
  result.to_xml
else
  puts result.to_csv
end
