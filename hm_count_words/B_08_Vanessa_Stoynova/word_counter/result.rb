module WordCounter
  
  require 'json'
  require 'digest'
  require 'sqlite3'
    require 'stringio'
    require 'rexml/document'

    class Result

      BAR_WIDTH = 20
    
        attr_accessor :word_counts, :marks_count

        def initialize(word_counts, marks_count)
            @word_counts = word_counts
            @marks_count = marks_count
        end
    
    def self.get_result_IF_parsed(filename)
    
      db = SQLite3::Database.new 'B_08_Vanessa_Stoynova.db'
      db.results_as_hash = true
      db_exists = db.execute "SELECT sql FROM sqlite_master WHERE type='table' AND name='statistics'"
      return nil if db_exists.size == 0 # stop if table doesn't exist

      hash = Digest::SHA256.file(filename).hexdigest
      id = db.execute "SELECT id FROM statistics WHERE hash=?", hash
      if id.size == 0
        return
      else
        id = id[0]["id"]
      end
      tempt = WordCounter::Result.new({}, 0)
      db.execute("SELECT word, count FROM word_counts WHERE statistics_id =?", id) do |row|
        if row["word"] == '$marks$'
          tempt.marks_count = row["count"]
        else
          tempt.word_counts[row["word"].to_s] = row["count"]
        end
      end

      if tempt.word_counts.size == 0 && tempt.marks_count == 0
        nil
      else
        tempt
      end
    end
    #def merge_results(res2)
      # word_counts.merge!(res2.word_counts.to_h) { |_, oldval, newval| newval + oldval }
      # word_counts = word_counts.sort_by { |word, count| [-count, word] }.to_h
      # marks_count += res2.marks_count
    #end

    def save_to_database(filename)
      db = SQLite3::Database.new 'B_08_Vanessa_Stoynova.db'
      
      db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS statistics (
          id integer primary key autoincrement,
          source_name string,
          hash string
        );
      SQL
      db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS word_counts (
          statistics_id integer,
          word string,
          count integer
        );
      SQL
      
      hash = Digest::SHA256.file(filename).hexdigest
      db.execute "INSERT INTO statistics (source_name, hash) VALUES(?, ?)", filename, hash 
      tempt = WordCounter::Result.new({}, 0)
      #merge_results(tempt) if tempt.word_counts.size > 0
      
      # I get the 0-th element because the it returns an array with all matches
      id = db.execute("SELECT id FROM statistics WHERE hash=?", hash)[0]
      

      word_counts.each do |word, count|
        db.execute "INSERT INTO word_counts VALUES(?, ?, ?);", id, word, count
      end   
      
      db.execute "INSERT INTO word_counts VALUES(?, ?, ?);", id, '$marks$', marks_count
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
        
            max_occur = word_counts.first.last
            
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
