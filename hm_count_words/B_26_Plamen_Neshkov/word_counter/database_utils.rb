require 'sqlite3'

module WordCounter
  class DatabaseUtils
    def initialize
      begin
        @db = SQLite3::Database.open "B_26_Plamen_Neshkov.db"

        @db.execute('CREATE TABLE IF NOT EXISTS statistics
          (id INTEGER PRIMARY KEY AUTOINCREMENT,
          source_name STRING NOT NULL,
          hash STRING NOT NULL)')

        @db.execute('CREATE TABLE IF NOT EXISTS word_counts
          (id INTEGER PRIMARY KEY AUTOINCREMENT,
          statistic_id INTEGER,
          word STRING NOT NULL,
          count INTEGER NOT NULL)')
      rescue SQLite3::Exception => e
        puts "Database shat itself."
        puts e
      ensure
        @db.close unless @db.nil?
      end
    end

    @@instance = DatabaseUtils.new

    def instance
      @@instance
    end

    private_class_method :new
  end
end

#db = WordCounter::DatabaseUtils.instance
