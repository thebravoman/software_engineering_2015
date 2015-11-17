require 'csv'
require 'json'
require 'rexml/document'
class symbolCounter
	def parse_file(name)
		@name = name
		result = [];
		f = File.open(@name, "r")
		hashw = Hash.new(0)
		counter = 0
		search_by = ['.',',','!','?']
		f.each_line do |line|
			search_by.each do |search_s|
				counter = counter + line.count(search_s).to_i 
			end
			symbols = line.split
			symbols.each do |symbol|
				if symbol.gsub!(/\W+/, '') == nil

				else
					symbol.gsub!(/\W+/, '')
				end

				symbol = symbol.downcase
				if not symbol==""
					hashw[symbol] += 1
				end
			end
		end
		hashw = hashw.sort_by{|symbol,num| symbol}
		hashw = hashw.sort_by {|symbol,num| [-num,symbol]}
		hashw.each do |symbol, freq| 
			result << [symbol,freq.to_s]
		end
		if not counter == 0
			result << ["\"marks\"",counter]
		end
		o_result = Result.new(result, counter)
		return o_result
	end
	def marks_count
		@counter
	end
end
class Result
	def initialize(result, counter)
		@result = result
		@counter = counter
	end
	def marks_count
		@counter
	end
	def symbol_counts
		@result
	end
	def to_csv
		res = ""
		@result.each do|symbol, i|	
    		res = res + "#{symbol},#{i.to_s}\n"
  		end
 		res
	end
	def to_json
		json_result = { :marks => "#{@counter}".to_i, :symbols => @result, }
  		JSON.pretty_generate(json_result)
	end
	def to_xml
		for_printing = ""
		xml_final = REXML::Document.new("")
  		xml_symbols = xml_final.add_element("symbol-counts")
  		xml_marks = xml_symbols.add_element("marks")
  		xml_marks.add_text "#{@counter}"
  		symbols_final = xml_symbols.add_element("symbols") 
  		@result.each do |index, key|
    		symbol = symbols_final.add_element('symbol')
    		symbol.add_attribute( 'count', key)
   			symbol.add_text "#{index}"
   		end
  		xml_final.write(for_printing, 1)
  		for_printing
	end
end 
filename = ARGV[0].to_s
format = ARGV[1].to_s
symbol_counter = symbolCounter.new
result = symbol_counter.parse_file(filename)
if format=="csv" or format == ""
	puts result.to_csv
end
if format=="json"
	puts result.to_json
end
if format=="xml" 
	puts result.to_xml
end