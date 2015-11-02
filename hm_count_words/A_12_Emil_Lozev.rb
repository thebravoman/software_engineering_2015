require 'csv'
require 'json'
require 'builder'

filename = ARGV[0]
option = ARGV[1]

res = open(filename).read.split(' ')

marks_sum = 0
marks = "\"marks\""

res.each do |word|
	marks_sum += word.count(". , ! ? :  ; = + -  _ ' \"[ ] ( ) { } „ “ * / \ ")
end

res.map!{|item| item.gsub(/\p{^Alnum}/, '') }
res.map!(&:downcase)

res.delete("")

histogram = Hash.new(0)
#histogram[marks] = marks_sum
res.each do |word|
	histogram[word] += 1
end

histogram = histogram.sort_by{|word, i| [-i, word]}

if option == 'csv'
	#CSV
	histogram.each do |word,i|
		puts "#{word},#{i}"
	end
	puts "\"marks\",#{marks_sum}"
	#CSV END

elsif option == 'csv'
	#JSON 
	hash = {
		"marks" => marks_sum.to_s,
		"words" => histogram,
	}
	puts JSON.pretty_generate(hash)
	#JSON END

elsif option == 'xml'
	#XML
	xml = Builder::XmlMarkup.new(:indent => 2)
	puts xml.tag!("words-counts"){
	  xml.marks marks_sum.to_s
	    xml.words {
	     	histogram.each do |word,i|
	     		xml.tag!("word count = #{i}") {xml.print word}
	     	end 
		}
	}	#END of XML
else 
	histogram.each do |word,i|
		puts "#{word},#{i}"
	end
	puts "\"marks\",#{marks_sum}"
end




