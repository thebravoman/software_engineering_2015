require 'sqlite3'

def write_to_file(file, data)
  File.open(file, 'w') do |f|
    f << data
  end
end

def save_to_db(result)
  db = SQLite3::Database.new 'A_21_Nikolay_Danailov.db'

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