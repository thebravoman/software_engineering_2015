require 'sqlite3'
require 'digest'

module WordCounter
	class DataBase
		DB_NAME = 'B_7_Valentin_Stoyanov.db'
		
		def save_in_db filename, hash, words, marks
			if File.exists? DB_NAME
				db = SQLite3::Database.open DB_NAME
			else 
				db = SQLite3::Database.new DB_NAME
			end
			
			statistics = db.execute <<-SQL
				CREATE TABLE IF NOT EXISTS statistics (
					id INTEGER PRIMARY KEY AUTOINCREMENT,
					source_name STRING,
					hash STRING
				);
			SQL
			word_counts = db.execute <<-SQL
				CREATE TABLE IF NOT EXISTS word_counts (
					statistic_id INTEGER,
					word STRING,
					count INTEGER
				);
			SQL
			
			stats = db.execute('SELECT * FROM statistics WHERE source_name LIKE "'+filename.to_s+'"')
			unless stats.size > 0
				db.execute('INSERT INTO statistics(source_name, hash) VALUES( ?, ? )', [filename.to_s, hash])
				last_id = db.last_insert_row_id
				words.each do |word, occur|
					db.execute('INSERT INTO word_counts(statistic_id, word, count) VALUES ( ?, ?, ? )', [last_id, word, occur])
				end
				db.execute('INSERT INTO word_counts(statistic_id, word, count) VALUES ( ?, ?, ? )', [last_id, '$marks$', marks])
			else
				db.execute('DELETE FROM word_counts WHERE statistic_id = ?', [stats.first])
				words.each do |word, occur|
					db.execute('INSERT INTO word_counts(statistic_id, word, count) VALUES( ?, ?, ? )', [stats.first, word, occur])
				end
				db.execute('INSERT INTO word_counts(statistic_id, word, count) VALUES( ?, ?, ? )', [stats.first, '$marks$', marks])
			end
		end
	end
end
