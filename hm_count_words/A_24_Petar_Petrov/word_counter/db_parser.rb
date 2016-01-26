require 'sqlite3'
require 'digest'

module WordCounter
	class DatabaseParser
		def self.create_db
			database = SQLite3::Database.new('A_24_Petar_Petrov.db')

			database.execute('create table if not exists Statistics(id integer primary key autoincrement,source_name string, hash string);')

			database.execute('create table if not exists Word_counts(statistic_id integer,word string,count integer);')
			database
		end
	
		def self.update_db(hash,db,filename)
		  digest = Digest::SHA256.new.hexdigest filename
		  db.execute('insert into Statistics(source_name,hash) values(?,?)',filename,digest)
		  get_id = db.execute('select id from Statistics where hash=?',digest)
			hash['words'].each do |key, value|
				db.execute('insert into Word_counts values(?,?,?);',get_id,key,value)
			end
			db.execute('insert into Word_counts values(?,?,?);',get_id,'%marks%',hash['marks'])
		end
	end
end
