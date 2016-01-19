module WordCounter
    require 'sqlite3'

    class Database
        def initialize(name)
            name = name.to_s
            @db = SQLite3::Database.new("#{name}")

            @db.execute('CREATE TABLE IF NOT EXISTS
        	 	statistics(
        		id INTEGER PRIMARY KEY AUTOINCREMENT,
        		source_name STRING,
        		hash STRING)')

            increment_started = @db.execute("SELECT * FROM statistics
                WHERE id = 0")

            if (increment_started.nil?)
                @db.execute(
                    "INSERT INTO statistics(id, source_name, hash)
                    VALUES (0, \'..\', \'..\') ")
            end

        	@db.execute('CREATE TABLE IF NOT EXISTS
        		 	word_counts(
        			statistic_id INTEGER,
        			word STRING,
        			count STRING)')
        end

        def save(identifier, words_count, marks_count)
            content = words_count.to_s
            word_counts_key = Digest::SHA256.digest(content).to_s
            identifier = identifier.to_s


            @db.execute(
                "INSERT INTO statistics(source_name, hash)
                VALUES (\'#{identifier}\', \'#{identifier}\') ")

            curr_row = @db.execute("SELECT id FROM statistics
                WHERE hash = \'#{identifier}\'")
            if(curr_row.length > 0)
                id = curr_row[0][0]
                words_count.each do |word, count|
                    save_word_to_db(id, word, count)
                end

                save_word_to_db(id, '$marks$', marks_count)
            end
        end

        def get_cached(identifier)
            cache_row = @db.execute(
                "SELECT id FROM statistics
                WHERE source_name = \'#{identifier}\'")

            if (cache_row.length > 0)
                id = cache_row[0][0]
                result = @db.execute(
                    "SELECT * FROM word_counts
                    WHERE statistic_id = \'#{id}\'")
            end

        end

        def save_word_to_db(statistic_id, word, count)
            @db.execute(
                "INSERT INTO word_counts(statistic_id, word, count)
                VALUES (\'#{statistic_id}\', \'#{word}\', \'#{count}\')")
        end
    end
end
