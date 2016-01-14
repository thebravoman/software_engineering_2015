require 'sqlite3'

module WordCounter
	class DatabaseParser
		def self.create_db
			database = SQLite3::Database.new('A_24_Petar_Petrov.db')

			database.execute('create table if not exists statistics(id integer,source_name string, hash string);')

			database.execute('create table if not exists word_counts(statistic_id integer,word string,count integer);')
			database
		end
	
		def self.update_db(hash,db)
			hash['words'].each do |key, value|
				db.execute('insert into word_counts values(?,?,?);',nil,key,value)
			end
			db.execute('insert into word_counts values(?,?,?);',nil,'%marks%',hash['marks'])
		end
	end
end
