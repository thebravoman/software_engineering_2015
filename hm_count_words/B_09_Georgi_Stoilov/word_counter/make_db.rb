require 'sqlite3'
require 'csv'
require 'json'
module WordCounter

  class MakeDataBase

    def make_db file, format, filename
        db = SQLite3::Database.open('B_09_Georgi_Stoilov.db')
        db.execute "CREATE TABLE IF NOT EXISTS word_counts(Id INTEGER,
                  Word TEXT, Occur INTEGER)"
        db.execute "CREATE TABLE IF NOT EXISTS statistics(Id INTEGER PRIMARY KEY, source_name STRING, hash STRING)"
      if(format == 'csv' || format == nil)
        id = 0
        CSV.open(file, 'r') do |l|
          if(File.file?(filename))
            id += 1
            db.execute "INSERT INTO statistics VALUES(?, ?, ?)", id, filename, @word_counter
          else
            filename = filename.gsub("\n",'')
            filename.insert(filename.size, '/**/*.*')

            Dir.glob(filename).each do |file|
              id += 1
              fille = file.split('/').last
              db.execute "INSERT INTO statistics VALUES(?, ?, ?)", id, fille, @word_counter
            end
          end
          l.each do |element1, element2|
            db.execute "INSERT INTO word_counts VALUES(NULL,?,?)", element1, element2
          end
        end
      elsif format == 'json'
        #something will happend
      elsif format == 'xml'
        #something will happend
      end
        rescue SQLite3::Exception => e

        puts "Exception occurred"
        puts e

        ensure
          db.close if db
    end

  end

end
