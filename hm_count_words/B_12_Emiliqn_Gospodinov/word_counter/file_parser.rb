require_relative 'parser'

module WordCounter
	class FileParser
		def parse_file(file)
			file_to_read = File.open(file, 'r')
			file_reader = file_to_read.read
			Parser.new.parse_string file_reader
		end 
	end
end
