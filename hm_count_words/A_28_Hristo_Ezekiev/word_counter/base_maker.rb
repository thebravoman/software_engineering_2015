require 'sqlite3'
require 'digest'

#http://ruby-doc.org/stdlib-2.1.0/libdoc/digest/rdoc/Digest.html
#http://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3/Database
class DB
	def self.db_connector(filename, h_words)
		dbase_file = "A_28_Hristo_Ezekiev.db"
		if !File.exists?(dbase_file)
			SQLite3::Database.new dbase_file
		end
		db = SQLite3::Database.open dbase_file
		db.execute "CREATE TABLE IF NOT EXISTS statistics(id INTEGER PRIMARY KEY, source_name STRING, hash STRING)"
		db.execute "CREATE TABLE IF NOT EXISTS word_counts(statistic_id INTEGER PRIMARY KEY, word STRING, count integer)"
		rows = db.execute "SELECT * FROM  statistics WHERE source_name LIKE '%#{filename1}%'"
		if !rows.any?
			sha256_file1 = Digest::SHA256.file filename
			db.execute "INSERT INTO statistics(source_name, hash) VALUES ('#{filename1}', '#{sha256_file1}')"
			sha256_file1 = Digest::SHA256.file filename
			h.h_words.each do |word, count|
				db.execute "INSERT INTO word_counts(statistic_id, word, count) VALUES ('#{id}', '#{word}', #{count})"
			end
		else
			puts "Already here"
		end
	end
end
