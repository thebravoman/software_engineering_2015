require 'sqlite3'
require 'word_counter/result'

def write_to_file(file, data)
  File.open(file, 'w') do |f|
    f << data
  end
end

def create_databases(db)
  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS statistics (
      id int,
      source_name string,
      hash string
    );
  SQL

  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS word_counts (
      statistic_id int,
      word string,
      count int
    );
  SQL
end

def get_result_from_db(db)
  tmp = WordCounter::Result.new

  db.execute "SELECT word, count FROM word_counts" do |row|
    # maybe I should update rows and not delete them, but... oh well...
    db.execute "DELETE FROM word_counts WHERE word=?", row["word"]

    if row["word"] != '$marks$'
      tmp.word_counts[row["word"].to_s] = row["count"]
    else
      tmp.marks_count = row["count"]
    end
  end

  # return nil if there table is empty
  if tmp.word_counts.size > 0 && tmp.marks_count != 0
    tmp
  else
    nil
  end
end

def merge_results(res1, res2)
  res1.word_counts.merge!(res2.word_counts.to_h) { |_, oldval, newval| newval + oldval }
  res1.word_counts = res1.word_counts.sort_by { |word, count| [-count, word] }.to_h
  res1.marks_count += res2.marks_count
  res1
end

def save_to_db(result)
  db = SQLite3::Database.new 'A_21_Nikolay_Danailov.db'
  db.results_as_hash = true
  create_databases db
  tmp = get_result_from_db db
  result = merge_results(result, tmp) unless tmp.nil?

  result.word_counts.each_with_index do |(word, count), index|
    db.execute "INSERT INTO word_counts VALUES (?,?,?);", nil, word, count
  end

  db.execute "INSERT INTO word_counts VALUES (?,?,?);", nil, "$marks$", result.marks_count
end

def print_result(result, format)
  if format == 'json'
    puts result.to_json
  elsif format == 'xml'
    puts result.to_xml
  else
    puts result.to_csv
  end

  save_to_db result
  write_to_file 'A_21_Nikolay_Danailov.svg', result.to_svg
end