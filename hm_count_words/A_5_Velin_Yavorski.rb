require 'word_counter'
require 'sqlite3'
require 'digest'

input = ARGV[0]
input2 = ARGV[1]
input3 = ARGV[2]

def make_database (result, input, sha)
	db = SQLite3::Database.new 'A_05_Velin_Yavorski.db'
	
	db.execute <<-SQL
	  CREATE TABLE IF NOT EXISTS statistics (
	  	id integer primary key autoincrement, 
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
	
	db.execute "INSERT INTO statistics(source_name, hash) VALUES ('#{input}','#{sha}');"
	get_id = db.execute('select id from Statistics where hash=?',sha)
	
	result.word_counts.each do |key, value|
	  db.execute "INSERT INTO word_counts VALUES ('#{get_id}','#{key}','#{value}');"
	end
	db.execute "INSERT INTO word_counts VALUES ('#{get_id}',$marks$,'#{result.marks_count}');"
end

def dir_process input
  str_parse = ""
  Dir["#{input}/**/*.*"].each do |f|
    if !(f.include? "~")
      file_contents = File.read("#{f}", col_sep: "$", encoding: "ISO8859-1:utf-8")		
      file_contents.each_line.each do |line|
        str_parse << line.to_s
      end
    end
  end
  str_parse
end

if(input.start_with?('http://') || input.start_with?('https://'))
  result = WordCounter.parse_webpage(input)
elsif File.file? input
  sha256 = Digest::SHA256.file input
  sha = sha256.hexdigest
  result = WordCounter.parse_file(input)
elsif input == "-d"
  result = WordCounter.parse (dir_process input2)
else
  result = WordCounter.parse input
end

if(input != "-d")
  if(input2 == "json")
	puts result.to_json
  elsif(input2 == "xml")
    puts result.to_xml
  else
    result.to_csv
  end
else
  if(input3 == "json")
   puts result.to_json
  elsif(input3 == "xml")
    puts result.to_xml
  else
    result.to_csv
  end
end

make_database(result, input, sha)

result.make_svg
