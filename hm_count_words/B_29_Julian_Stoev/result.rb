require 'json'
require 'rexml/document'
require "sqlite3"

class Result
	
	attr_accessor :sumofmarks, :words_hash

	def initialize(words_hash, sumofmarks)
		@sumofmarks = sumofmarks
		@words_hash = words_hash
	end

	def marks_count
		if sumofmarks != 0 
			puts "marks,#{sumofmarks}"
		end
	end

	def word_count
		words_hash.each do |key, value|
			puts "#{key},#{value}"
		end
	end

	def to_data_base
		db = SQLite3::Database.new "B_29_Julian_Stoev.db"
		db.execute "CREATE TABLE IF NOT EXISTS statistics(id INTEGER PRIMARY KEY AUTOINCREMENT, hash TEXT);"
		db.execute "CREATE TABLE IF NOT EXISTS wordCounts(statistic_id INTEGER PRIMARY KEY AUTOINCREMENT,word TEXT, count INT);"
		##db.execute "INSERT INTO statistics(hash) VALUES(?);", [words_hash]
		words_hash.each{ |value, key|
		db.execute "INSERT INTO wordCounts(word, count) VALUES(?,?);", [value,key]
		}
		db.execute "INSERT INTO wordCounts(word, count) VALUES('$marks$',?);", [sumofmarks]
	end

	def to_csv
		words_hash.each do |key, value|
			puts "#{key},#{value}"
		end	
		if sumofmarks != 0 
			puts "\"marks\",#{sumofmarks}"
		end
	end

	def to_json
		content_hash = Hash.new(0)
		content_hash["marks"] = sumofmarks
		content_hash["words"] = words_hash
		puts JSON.pretty_generate(content_hash)
	end

	def to_xml
		file_xml = REXML::Document.new('')
		word_count = file_xml.add_element('word-counts')
		marks_xml = word_count.add_element('marks').add_text(sumofmarks.to_s)
		words_xml = word_count.add_element('words')
		words_hash.each do |key, value|
			words_xml.add_element('word').add_text(key).add_attribute('count', value.to_s)
		end
		form = REXML::Formatters::Pretty.new
 		form.compact = true
 	 	form.write(file_xml, $stdout)
 	 	puts
	end
	
	def rect x, y, w, h
		'<rect 
			x="'+x.to_s+'" 
			y="'+y.to_s+'" 
			width="'+w.to_s+'" 
			height="'+h.to_s+'"
			style="fill:green;
			stroke:black;
			opacity:0.9;
			stroke-width:4;"
		/>'
	end

	def text x, y, contents
		'<text 
			x="'+x.to_s+'" 
			y="'+y.to_s+'"
			fill="black"
			font-size="15" 
			transform="rotate('+x.to_s+','+y.to_s+')">'+contents+'
       	</text>'
	end

	def generate_svg
		File.open('B_29_Julian_Stoev.svg', 'w') do |f|
			ratio = 600.0 / words_hash.first[1]
        	f.write('<svg xmlns="http://www.w3.org/2000/svg">')		
			y_cor = 630
			width = 80
			x_cor = width 
			y_cor = y_cor + width
			words_hash.each do |word|
	          	rect_relative_height = word[1] * ratio
	          	f.write(rect(x_cor, y_cor - rect_relative_height, width, rect_relative_height))
	          	f.write(text(x_cor, y_cor + width/4, word[0]))
	         	x_cor = x_cor + width + 15
	        end
			f.write('</svg>')
      	end
	end
end













