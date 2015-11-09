require 'json'
require 'csv'
require 'rexml/document'

filename = ARGV[0].to_s
format = ARGV[1].to_s
countwords = 0
countmarks = 0
index = 0
my_array = ""
File.open(filename, "r").each_line do |line|
	my_array += " " + line.downcase
end
searchword  =  my_array.tr("\n","")
searchword = searchword .split(' ')
searchword.each do |item|
	if  /[[:punct:]]/.match(item)
		countmarks = countmarks + 1	
		searchword[index] = item.gsub(/[[:punct:]]/, "")
		index = index + 1	
	else
		searchword[index] = item
		index = index + 1	
	end
end
searchword =  searchword.sort
j = searchword.first
wordhash = Hash.new()
searchword.each do |i|
	
	if i == j
		countwords = countwords + 1
		wordhash[j] = countwords
	else
		j = i
		countwords = 1
		wordhash[j] = countwords
	end
	
end
wordhash = wordhash.sort_by{|k, v| [-v, k]}
if format == "json" 
	jsonhash = Hash.new()
	jsonhash = {
			"marks" => countmarks,
			"words" => wordhash
			}
	puts JSON.pretty_generate(jsonhash)

elsif format == "xml"

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

else 

	wordhash.each_with_index do |(k, v)|
 		 puts "#{k},#{v}"
	end
	if countmarks > 0	
		print '"marks",',countmarks
		puts
	end
end
