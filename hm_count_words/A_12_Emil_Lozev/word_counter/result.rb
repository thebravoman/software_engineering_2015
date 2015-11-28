require 'csv'
require 'json'
require 'rexml/document'

class Result
	attr_accessor :marks_count, :word_counts
	
	def initialize
		@marks_count = 0
		@word_counts = Hash.new
	end
	
	def to_csv
		@word_counts.each do |word,i|
			puts "#{word},#{i}"
		end
	
		if marks_count != 0	
			puts "\"marks\",#{@marks_count}"
		end	
	end
	
	def to_json
		hash = {
		"marks" => @marks_count,
		"words" => @word_counts,
	}
	puts JSON.pretty_generate(hash)
	end
	
	def to_xml
	
		xml = Builder::XmlMarkup.new(:indent => 2)
		xml.tag!("words-counts"){
	  	xml.marks @marks_count.to_s
	   	 xml.words {
	     	@word_counts.each do |word,i|
	     		xml.tag!('word', {'count' => i}, word)
	     	end 
	     	}
		}
		
	end
	def graph(size,x)
		
		y = 100
			string=  '<rect width="50" height="' + (size * 10).to_s + '" x="' + x.to_s + '" y="' + y.to_s+ '" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>'
			return string
		end
		
	def to_svg	
	
		File.open("A_12_Emil_Lozev_result.svg","w") do |f|
			f.write('<svg xmlns="http://www.w3.org/2000/svg">')
			x = 10
			@word_counts.each do |word,i|
				f.write(graph(i,x))
				f.write('<text x="'+(x+2).to_s+'" y="200" fill="black">'+word+'</text>')
				x+= 60
			end
			f.write('</svg>')
		end
	
	end
end

