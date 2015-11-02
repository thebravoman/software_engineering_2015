require 'csv'
require 'json'
require 'builder'
	file = ARGV[0]
	sett = ARGV[1]
	f = open(file).read.split(' ')
	summark = 0
	marks = "\"marks\""

	f.each do |word|
		summark += word.count(". , ! ? :  ; = + -  _ ' \"[ ] ( ) { } „ “ * / \ ")
	end

	f.map!{|item| item.gsub(/\p{^Alnum}/, '') }
	f.map!(&:downcase)
	f.delete("")
	hash = Hash.new(0)
	f.each do |word|
		hash[word] += 1
	end

	hash = hash.sort_by{|word, i| [-i, word]}
	if sett == 'csv'
		hash.each do |word,i|
			puts "#{word},#{i}"
		end
	puts "\"marks\",#{summark}"
	elsif sett == 'json'
		hash = {
			"marks" => summark.to_s,
			"words" => hash,
		}
	puts JSON.pretty_generate(hash)
	elsif sett == 'xml'
		xml = Builder::XmlMarkup.new(:indent => 2)
		puts xml.tag!("words-counts"){
			xml.marks summark.to_s
			xml.words {
		   		hash.each do |word,i|
	     			xml.tag!("word count = #{i}") {
	     				xml.print word
	     			}
	     			end 
			}
		}
	else 
		hash.each do |word,i|
			puts "#{word},#{i}"
		end
		puts "\"marks\",#{summark}"
	end
