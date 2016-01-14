require 'sqlite3'
require 'digest'
ID = 0
SOURCE_NAME = 1
HASH = 2

class DB
	def self.db_connector(filename, h_words)
		is_processed = false
		dbname = "A_19_Nikolay_Rangelov.db"
		sha256_file = Digest::SHA256.file filename

		if !File.exists?(dbname)
			SQLite3::Database.new dbname
		end
		db = SQLite3::Database.open dbname

		db.execute "CREATE TABLE IF NOT EXISTS statistics(id INTEGER PRIMARY KEY, source_name STRING, hash STRING)"
		db.execute "CREATE TABLE IF NOT EXISTS word_counts(statistic_id INTEGER PRIMARY KEY, word STRING, count integer)"

		rows = db.execute "SELECT * FROM  statistics WHERE source_name LIKE '%#{filename}%'"
		if rows.any?
			rows.each do |row|
				if row[HASH] == sha256_file.hexdigest
					is_processed = true
				end
			end
		end
		if !is_processed
			db.execute "INSERT INTO statistics(source_name, hash) VALUES ('#{filename}', '#{sha256_file}')"
			h_words.each do |word, count|
				db.execute "INSERT INTO word_counts( word, count) VALUES ('#{word}', #{count})"
			end
		end
		puts is_processed
	end
end