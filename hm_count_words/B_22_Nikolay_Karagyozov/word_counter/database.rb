module WordCounter
  require 'digest'

  class LocalData

    def self.get_cached_data(content)
        @digest = Digest::SHA256.digest(content)

        cached_id = @db.execute(
          "SELECT id FROM statistics
           WHERE hash=?", @digest)
        if (!cached_id.empty?)
          result = @db.execute("SELECT * FROM word_counts
                               WHERE statistics_id=?",cached_id)
          return Result.new(result.word, result.count)
        end

        # delete

        return nil
    end

    def self.setup_database(uri)
      @uri = uri
      @db = SQLite3::Database.new(@uri)
      @db.execute(Queries::CREATE_STATISTICS_TABLE)
      @db.execute(Queries::CREATE_WORD_COUNTS_TABLE)
    end

    def self.save(result)
      statistics_id = get_statistics_id

      result.word_counts.each do |key, value|
        @db.execute(Queries::INSERT_NEW_WORD_COUNT, [statistics_id, key, value])
      end

      @db.execute(Queries::INSERT_NEW_WORD_COUNT, [statistics_id, "$marks$", result.marks_count])
    end

    private

    def self.get_statistics_id
      id = @db.execute(
      "SELECT id FROM statistics
       WHERE source_name=?", @uri)

      if (id.empty?)
        @db.execute(Queries::INSERT_NEW_STATISTIC, [@uri, @digest])
        id = @db.last_insert_row_id
      end

      id
    end
  end
end
