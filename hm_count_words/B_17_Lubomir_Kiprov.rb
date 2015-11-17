require 'json'
require 'csv'
require 'rexml/document'
class Result
  attr_accessor :countmarks
  attr_accessor :wordhash
  def initialize
    @countmarks = 0
    @wordhash = Hash.new 0
  end

  def to_json

	jsonhash = Hash.new()
	jsonhash = {
			"marks" => countmarks,
			"words" => wordhash
			}
	JSON.pretty_generate(jsonhash)
  end

  def to_xml

	xml= REXML::Document.new()
	xmlwcount = xml.add_element('word-counts')
	xmlmarks = xmlwcount.add_element('marks')
	xmlmarks.add_text "#{countmarks}"
	xmlwords = xmlwcount.add_element('words')
	
	wordhash.each do |k, v|
		word = xmlwords.add_element('word')
		word.add_attribute('count', v)
		word.add_text "#{k}"
	end
	
	output = REXML::Formatters::Pretty.new
	output.compact = true
  	output.write(xml, $stdout)
  	puts
  end

  def to_csv
	wordhash.each_with_index do |(k, v)|
 		 puts "#{k},#{v}"
	end
	if countmarks > 0	
		print '"marks",',countmarks
		
	end
  end
end

class WordCounter 
	private
	def parse(string)
		result = Result.new
		countwords = 0
		
		index = 0


		searchword  =  string.tr("\n","")
		searchword = searchword .split(' ')
		searchword.each do |item|
			if  /[[:punct:]]/.match(item)
				result.countmarks = result.countmarks + 1	
				searchword[index] = item.gsub(/[[:punct:]]/, "")
				index = index + 1	
			else
				searchword[index] = item
				index = index + 1	
			end
		end
		searchword =  searchword.sort
		j = searchword.first
		searchword.each do |i|
	
			if i == j
				countwords = countwords + 1
				result.wordhash[j] = countwords
			else
				j = i
				countwords = 1
				result.wordhash[j] = countwords
			end
	
		end
		result.wordhash = result.wordhash.sort_by{|k, v| [-v, k]}
		result
	end
public
	def parse_file(path)
		my_array = ""
		File.open(path, "r").each_line do |line|
			my_array += " " + line.downcase
		end
		parse my_array
	end
end

filename = ARGV[0]
format = ARGV[1]

result = WordCounter.new
word_counter = result.parse_file filename
if format == "json" 
	puts word_counter.to_json
elsif format == "xml"
	 word_counter.to_xml
else 
	puts word_counter.to_csv	
end
