require 'rexml/document'
require 'rexml/element'
require 'json'

  words = File.read(ARGV[0])
  my_xml = REXML::Document.new('')
  marks_counter = 0
  marks_pat = /[\p{P}\p{S}]/u
  
  words.each_line do |line|
    line.downcase.scan(/\b[A-Za-z0-9]+\b/i).each do |word|
  		marks_counter += word.count(".,!?()[]\"")
  		word = word.gsub(/[,()!.?_"]/,'')
  			if result.has_key?(word)
  				result[word] = 1
  			end
  	end

  line.downcase.scan(marks_pat).each { marks_counter += 1 }

end

result=result.sort_by{|k,v| [-v,k]}
  
  if ARGV[1] == 'csv' or ARGV[1] == nil
  	result.each do |elements|
   	word.add_element(words_element)
  	puts my_xml
  end
