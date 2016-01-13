module WordCounter
	
	require 'sqlite3'
	require 'json'
  	require 'rexml/document'
  	require 'stringio'

  	class Result

  		BAR_WIDTH = 20
		
    		attr_reader :word_counts, :marks_count

    		def initialize(word_counts, marks_count)
      			@word_counts = word_counts
      			@marks_count = marks_count
    		end

		def merge_results(res2)
  			word_counts.merge!(res2.word_counts.to_h) { |_, oldval, newval| newval + oldval }
  			word_counts = word_counts.sort_by { |word, count| [-count, word] }.to_h
  			marks_count += res2.marks_count
		end

		def save_to_database
			db = SQLite3::Database.new 'B_08_Vanessa_Stoynova.db'
			db.results_as_hash = true
			
			db.execute <<-SQL
				CREATE TABLE IF NOT EXISTS statistics (
					id int,
					source_name string,
					hash string
				);
			SQL
			db.execute <<-SQL
				CREATE TABLE IF NOT EXISTS word_counts (
					statistics_id int,
					word string,
					count int
				);
			SQL
			
			tempt = WordCounter::Result.new({},0)
			db.execute "SELECT word, count FROM word_counts" do |row|
				db.execute "DELETE FROM word_counts WHERE word=?", row["word"]
				if row["word"] == '$marks$'
					rempt.marks_count = row["count"]
				else
					tmpt.word_counts[row["word"].to_s] = row["count"]
				end
			end
			merge_results(tempt) if tempt.word_counts.size > 0
				
			word_counts.each do |word, count|
				db.execute "INSERT INTO word_counts VALUES(?, ?, ?);",  nil, word, count
			end		
				
		end				


		def add_text x, y, word
			'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+word.to_s+'</text>'
		end
		
		def draw_bar x, y, w, h
			'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="'+w.to_s+'" height="'+h.to_s+'" fill = "purple" style="stroke-width:3;stroke:rgb(0,0,0)"/>'
		end

    		def to_csv
      			result = StringIO.new
      			word_counts.each do |word, occurence|
        			result << "#{word},#{occurence}\n"
      			end

      			if marks_count > 0
        			result << "\"marks\",#{marks_count}\n"
      			end

      			result.string
    		end

    		def to_json
      			hash_format = {
        			"marks" => marks_count,
        			"words" => word_counts
      			}

      			JSON.pretty_generate(hash_format)
    		end

    		def to_xml
      			doc = REXML::Document.new
      			doc.context[:attribute_quote] = :quote
      			
      			word_counts_element = doc.add_element('word-counts')
      			marks_element = word_counts_element.add_element('marks')
      			marks_element.add_text(marks_count.to_s)

      			words_element = word_counts_element.add_element('words')

      			word_counts.each do |word, count|
        			word_element = words_element.add_element('word')
        			word_element.add_attributes({'count' => count.to_s })
        			word_element.add_text(word)
      			end

      			formatter = REXML::Formatters::Pretty.new(4)
      			formatter.compact = true
      			result = ''
      			formatter.write(doc, result)
      			result
    		end

    		def to_svg
    		
      			max_occur = word_counts[0][1]
      			
      			current_x = 10
      			current_y = 100
      			height = 40
      			width = 30

      			File.open("B_08_Vanessa_Stoynova.svg", "w") do |file|
        			file.write('<svg xmlns="http://www.w3.org/2000/svg" width="9000" height="1000">')

        			word_counts.each do |word, count|
        			
         				file.write(draw_bar(current_x, current_y, width, height*count ))
         				file.write(add_text(5, 35, "\"Marks\":"))
         				file.write(add_text(55, 35, marks_count))
      					file.write(add_text(current_x, current_y - 10, word)) 
      					file.write(add_text(current_x + 10, current_y + height * count + 13, count)) 
      					
          				current_x += BAR_WIDTH + 30
          				current_y = 100
          				width = 30
          				
        			end

        			file.puts "</svg>"
      			end
    		end
  	end
end
