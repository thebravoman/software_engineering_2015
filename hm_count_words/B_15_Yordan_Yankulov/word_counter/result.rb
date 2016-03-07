require 'json'
require 'rexml/document'
require 'csv'
require 'sqlite3'
require 'digest'
require_relative 'file_parser'
module WordCounter
  class Result < FileParser

    def initialize punct, helpe, a
      @punctuation = punct
      @help = helpe
      @a = a
    end
    def to_db
      if(File.exist?("./B_15_Yordan_Yankulov.db") !=  true)
  			db  = SQLite3::Database.new("B_15_Yordan_Yankulov.db")
  		else
  			db = SQLite3::Database.open("B_15_Yordan_Yankulov.db")
  		end
      db.execute "create table if not exists statistics(id INTEGER PRIMARY KEY AUTOINCREMENT,
      source_name  string, hash string);"
      db.execute "create table if not exists word_counts(statistic_id int, word string, count string);"
      db.execute "insert into statistics(source_name, hash) values(?,null);", [$a]
      stat_id = db.last_insert_row_id
      @help.each{ |element|
        db.execute "insert into word_counts(statistic_id, word, count) values(?,?,?);", [stat_id,element[0],element[1]]
    	}
      db.execute "insert into word_counts(statistic_id, word, count) values(?,'$marks$',?);", [stat_id,@punctuation]
    rescue SQLite3::Exception => e

      puts "Exception occurred"
      puts e
    end
    def rectange element, foo, foo1
      '<rect x="150" y="'+(foo-15).to_s+'" width="'+foo1.to_s+'" height="'+20.to_s+'" style="fill:blue;stroke:darkblue;stroke-width:1;stroke-opacity:0.9" />'
    end
    def word element, foo
      '<text x="1" y="'+foo.to_s+'" fill="black">'+element.to_s+'</text>'
    end
  	def to_csv
      to_db
      to_svg
      @help.each{ |element|
    	   puts "#{element[0]},#{element[1]}"
    	}
    	if @punctuation!=0
    		puts "\"marks\",#{@punctuation}"
    	end
  	end

  	def to_json
      to_db
      to_svg
    	if @punctuation != 0
    		puts JSON.pretty_generate("marks" => @punctuation,"words" => @help)
    	else
    		puts JSON.pretty_generate("words" => @help)
    	end
  	end

  	def to_xml
      to_db
      to_svg
  		my_xml = REXML::Document.new('')
  		word_counts = my_xml.add_element('word-counts')
  		if @punctuation != 0
  			word_counts.add_element('marks').add_text"#{@punctuation}"
  		end
  		words = word_counts.add_element('words')
  		@help.each do |key,count|
  		word = words.add_element('word', {'count' => "#{count}"}).add_text"#{key}"
  	end
  	formatter = REXML::Formatters::Pretty.new
  	formatter.compact = true
  	formatter.write(my_xml, $stdout)
    puts
  	end

    def to_svg
      File.open("B_15_Yordan_Yankulov.svg","w") do |f|
        f.write('<svg xmlns="http://www.w3.org/2000/svg">')
        foo = 30
        foo1 = 500
        d = foo1 / @a
        counter = 0
        element_remember = 0
        @help.each{ |element|
          if element_remember != element[1]
            foo1 -= d
          end
          f.write(rectange element[0],foo, foo1)
          f.write(word element[0], foo)
          foo += 20

          element_remember = element[1]
        }
        f.write('</svg>')
      end
    end
  end
end
