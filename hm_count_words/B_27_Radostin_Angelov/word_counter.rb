module WordCounter
	require_relative "word_counter/parser.rb"
	require_relative "word_counter/file_parser.rb"
	require_relative "word_counter/web_parser.rb"
	require_relative 'word_counter/folder_parser.rb'
	require_relative 'word_counter/result.rb'
	require_relative 'word_counter/database.rb'

	def self.parse_file(path)
		return FileParser.new.parse(path)
	end

	def self.parse_webpage(url)
		return WebpageParser.new.parse(url)
	end

	def parse
	end

	def self.parse_folder(path)
		return FolderParser.new.parse(path)
	end

	def self.parse_string(string)
		return  Parser.new.parse(string)
	end

	def self.parse_array(word_counts_rows, identifier)
		word_counts = []
		word_counts_rows[0...-1].each do |id, word, count|
			word_counts.push([word, count])
		end

		marks_count = word_counts_rows.last.last.to_i
		return result = Result.new(word_counts, marks_count, identifier)
	end

	def self.get_cached(identifier)
		db = Database.new('B_27_Radostin_Angelov.db')
		cache = db.get_cached(identifier)
		if (not cache.nil?)
			if (cache.length > 0)
				return WordCounter::parse_array(cache, identifier)
			end
		end
	end
end
