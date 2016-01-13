require 'csv'
require 'json'
require 'rexml/document'
require 'sqlite3'

class Result
	attr_accessor :marks_count, :word_counts
	
	def initialize 
		@marks_count = 0
		@word_counts = Hash.new
		#@filename = filename
	end
	
	def to_csv
		@word_counts.each do |word,i|
			puts "#{word},#{i}"
		end
	
		if marks_count != 0	
			puts "\"marks\",#{@marks_count}"
		end	
		to_db
	end
	
	def to_json
		hash = {
		"marks" => @marks_count,
		"words" => @word_counts,
	}
		puts JSON.pretty_generate(hash)
		to_db
	end
	
	 def to_db
     
      db = SQLite3::Database.new "A_12_Emil_Lozev.db"
      db.execute "CREATE TABLE IF NOT EXISTS statistics(id INTEGER PRIMARY KEY AUTOINCREMENT,
      source_name TEXT, hash TEXT);"
      db.execute "CREATE TABLE IF NOT EXISTS word_counts(statistic_id INTEGER PRIMARY KEY AUTOINCREMENT,
      word TEXT, count INT);"
      db.execute "INSERT INTO statistics(source_name, hash) VALUES(?,?);", [$filename]
      @word_counts.each do |word, i|
       db.execute "INSERT INTO word_counts(word, count) VALUES(?,?);", [word,i]
      end
      db.execute "INSERT INTO word_counts(word, count) VALUES('$marks$',?);", [@marks_count]
    
    end

	def to_xml
		to_db
		xml = Builder::XmlMarkup.new(:indent => 2)
		xml.tag!("word-counts"){
	  	xml.marks @marks_count.to_s
	   	 xml.words {
	     	@word_counts.each do |word,i|
	     		xml.tag!('word', {'count' => i}, word)
	     	end 
	     	}
		}
		
	end


	def graph(size,x,y)
		'<rect width="40" height="' + (size * 10).to_s + '" x="' + x.to_s + '" y="' + (y - (size * 10)).to_s+ '" style="fill:rgb(0,255,128);stroke-width:3;stroke:rgb(0,0,0)"/>'
	end
		
	def to_svg	
	key, value = @word_counts.first
		File.open("A_12_Emil_Lozev.svg","w") do |f|
			f.write('<svg xmlns="http://www.w3.org/2000/svg">')
			x = 10
			y = value.to_i * 10 + 100
			@word_counts.each do |word,i|
				f.write(graph(i,x,y))
				#f.write('<svg height="100" width="200">')
				if(x == 10)
					f.write('<text x="'+(x+2).to_s+'" y="' + (y + 40).to_s + '" fill="black" transform="rotate(90 10,20)" >'+word+'</text>')
				else
					f.write('<text x="'+(x+2).to_s+'" y="' + (-(y + 40)).to_s + '" fill="black" transform="rotate(90 10,20)" >'+word+'</text>')
				end
				#f.write('</svg>')
				x+= 60
			end
			f.write(graph(@marks_count,x, y))
			f.write('<text x="' + (x+2).to_s + '" y="' + (y + 40).to_s + '" fill="black">marks</text>')
			f.write('</svg>')
		end
	
	end
end

