require 'digest'

DATABASE_URL = 'A_21_Nikolay_Danailov.db'

def create_databases(db)
  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS statistics (
      id integer primary key autoincrement,
      source_name string,
      hash string
    );
  SQL

  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS word_counts (
      statistic_id integer,
      word string,
      count integer
    );
  SQL
end

def get_res_from_for_file(file)
  db = SQLite3::Database.new DATABASE_URL
  db.results_as_hash = true

  db_exists = db.execute 'SELECT sql FROM sqlite_master WHERE type="table" AND name="statistics"'
  return if db_exists.size == 0 # stop if table doesn't exist

  wanted_hash = Digest::SHA256.file(file).hexdigest
  wanted_id = db.execute 'SELECT id FROM statistics WHERE hash=?', wanted_hash

  if wanted_id.size > 0
    wanted_id = wanted_id[0]['id']
  else
    return
  end

  query = db.execute 'SELECT word, count FROM word_counts WHERE statistic_id=?', wanted_id
  tmp = WordCounter::Result.new

  if query.size > 0
    query.each do |row|
      if row['word'] != '$marks$'
        tmp.word_counts[row['word'].to_s] = row['count']
      else
        tmp.marks_count = row['count']
      end
    end
  else
    return
  end

  # return nil if the table is empty
  if tmp.word_counts.size > 0 && tmp.marks_count != 0
    tmp
  else
    nil
  end
end

def save_res_to_db(result, parsed_file)
  db = SQLite3::Database.new DATABASE_URL
  create_databases db

  hash = Digest::SHA256.file(parsed_file).hexdigest
  db.execute "INSERT INTO statistics(source_name, hash) VALUES (?,?)", parsed_file, hash
  file_id = db.execute("SELECT id FROM statistics WHERE hash=?", hash)[0]

  result.word_counts.each_with_index do |(word, count), index|
    db.execute "INSERT INTO word_counts VALUES (?,?,?);", file_id, word, count
  end

  db.execute "INSERT INTO word_counts VALUES (?,?,?);", file_id, '$marks$', result.marks_count
end