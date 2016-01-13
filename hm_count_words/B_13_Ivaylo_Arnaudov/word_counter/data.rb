module WordCounter
  require 'sqlite3'

  DATABASE_FILENAME = "B_13_Ivaylo_Arnaudov.db"

  class Data
    def self.save(source_name, source_hash, result)
      word_counts = result.word_counts
      marks_count = result.marks_count

      SQLite3::Database.new(DATABASE_FILENAME) do |db|
        create_stats_query = <<-SQL
          CREATE TABLE IF NOT EXISTS statistics (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            source_name TEXT,
            hash VARCHAR(64)
          );
        SQL

        create_word_counts_query = <<-SQL
          CREATE TABLE IF NOT EXISTS word_counts (
            statistics_id INTEGER,
            word TEXT,
            count INTEGER
          );
        SQL

        db.execute(create_stats_query);
        db.execute(create_word_counts_query);

        # Check if there's a statistics for this source
        rows = db.execute("SELECT * FROM statistics WHERE source_name = ?",
                          source_name);

        puts "#{rows}"
        # If such stats exists
        if rows.length > 0
          stats_id = rows[0]
          stats_hash = rows[2]

          # Check if the source has changed since the last update of the stats
          if stats_hash != source_hash
            # Delete all rows from the word_counts for the current statistics
            db.execute("DELETE FROM word_counts WHERE statistics_id = ?;", stats_id);

            word_counts.each do |key, value|
              db.execute("INSERT INTO word_counts (statistics_id, word, count)
                          VALUES (?, ?, ?)", [stats_id, key, value])
            end
            db.execute("INSERT INTO word_counts (statistics_id, word, count)
                       VALUES (?, ?, ?)", [stats_id, "$marks$", marks_count]);
          end
        else
          # If the stats doesn't exists, create a stats record
          db.execute("INSERT INTO statistics (source_name, hash) VALUES (?, ?)",
                     [source_name, source_hash]);

          # Add the word counts, while adding a foreign key to the new stats
          new_stats_id = db.last_insert_row_id
          word_counts.each do |key, value|
              db.execute("INSERT INTO word_counts (statistics_id, word, count)
                          VALUES (?, ?, ?)", [new_stats_id, key, value])
          end
          db.execute("INSERT INTO word_counts (statistics_id, word, count)
                       VALUES (?, ?, ?)", [new_stats_id, "$marks$", marks_count])
        end
      end
    end
  end
end
