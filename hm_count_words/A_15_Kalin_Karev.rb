require_relative './A_15_Kalin_Karev/word_counter'
require 'sqlite3'

file_name = ARGV[0]
format_print = ARGV[1]
input = ARGV[2]
#format = "string"

def database answer
	db = SQLite3::Database.new 'A_15_Kalin_Karev.db'
	db.execute <<-SQL
		CREATE TABLE IF NOT EXISTS statistics (
			id integer primary key autoincrement,
			source_n string,
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
		
		answer.word_counts.each do |k, v|
			db.execute "INSERT INTO word_counts VALUES ('#{nil}','#{k}','#{v}');"
		end
		
		db.execute "INSERT INTO word_counts VALUES ('#{nil}',$marks$,'#{answer.marks_count}');"
end

def dir file_name
	s_parse = ""
	Dir["#{file_name}/**/*.*"].each do |word|
		if !(word.include? "~")
			File.readlines(word).each do |l|
				s_parse << l.to_s
			end
		end
	end
	s_parse
end

if( file_name.start_with?('http://') || file_name.start_with?('https://'))
	answer = WordCounter.parse_webpage(file_name)
elsif File.file? file_name
	answer = WordCounter.parse_file(file_name)
elsif file_name == "-d"
	answer = WordCounter.parse (dir format_print)
else
	answer = WordCounter.parse file_name 
end

=begin
if format_print == "csv"
	puts answer.to_csv
end
=end

if format_print == "json"
	puts answer.to_json

elsif format_print == "xml"
	puts answer.to_xml
else 
	puts answer.to_csv
end

database answer

answer.make_svg
