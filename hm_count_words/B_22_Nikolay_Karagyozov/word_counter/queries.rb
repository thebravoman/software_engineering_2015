module WordCounter
  class Queries
    CREATE_STATISTICS_TABLE =
    "CREATE TABLE IF NOT EXISTS statistics (
      id INTEGER PRIMARY KEY,
      source_name TEXT,
      hash TEXT
    );"

    CREATE_WORD_COUNTS_TABLE =
    "CREATE TABLE IF NOT EXISTS word_counts (
      statistics_id INTEGER,
      word TEXT,
      count INTEGER
    );"

    INSERT_NEW_WORD_COUNT =
    "INSERT INTO word_counts (statistics_id, word, count)
     VALUES (?, ?, ?)"

    INSERT_NEW_STATISTIC =
    "INSERT INTO statistics (source_name, hash)
    VALUES (?, ?)"
  end
end
