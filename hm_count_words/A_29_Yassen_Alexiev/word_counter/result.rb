require 'json'
require 'rexml/document'
require 'sqlite3'
require 'digest'
require_relative '../svg_parser.rb'

module WordCounter
	class Result
		def initialize(result, marks_count)
			@result = result
			@marks_count = marks_count
		end

		def to_db
      	if(File.exist?("./A_29_Yassen_Alexiev.db") !=  true)
  				db  = SQLite3::Database.new("A_29_Yassen_Alexiev.db")
  			else
  				db = SQLite3::Database.open("A_29_Yassen_Alexiev.db")
  			end
    	  	db.execute "create table if not exists statistics(id INTEGER PRIMARY KEY AUTOINCREMENT,
    	  	source_name  string, hash string);"
    	  	db.execute "create table if not exists word_counts(statistic_id int, word string, count string);"
    	  	xdg = Digest::SHA256.file $a
    	  	xdg.hexdigest
    	  	db.execute "insert into statistics(source_name, hash) values(?,?);", [$a,xdg.to_s]
    	  	stat_id = db.last_insert_row_id 
    	  	
    	  	@help.each{ |element|
    	  	  db.execute "insert into word_counts(statistic_id, word, count) values(?,?,?);", [stat_id,element[0],element[1]]
    		}

      		db.execute "insert into word_counts(statistic_id, word, count) values(?,'$marks$',?);", [stat_id,@punctuation]
    		rescue SQLite3::Exception => e

      		puts "Exception occurred"
      		puts e
    	end

		def marks_count
			@marks_count
		end
	
		def word_counts
			@result
		end
	
		def to_csv
			var = "" 
			@result.each do |word, count|	
				var = var + "#{word},#{count.to_s}\n"
			end
			var
		end		
		
		def to_json
			json_format = { :marks => "#{marks_count}", :words => @result.to_a }
			puts JSON.pretty_generate(json_format)
		end
		
		def to_xml
			format_xml_files = REXML::Document.new("")
		
			format_xml_word_counts = format_xml_files.add_element('word-counts')
		  
			format_xml_marks = format_xml_word_counts.add_element('marks')
			format_xml_marks.add_text "#{marks_count}"
		  
			format_xml_words = format_xml_word_counts.add_element('words')
		  
			@result.each do |index, key|
				word = format_xml_words.add_element('word')
				word.add_attribute( 'count', key)
		
				word.add_text "#{index}"
			end
		
			out = ""
			format_xml_files.write(out, 1)
			puts out
		end 
	end
end