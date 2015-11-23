require 'word_counter/parser'

module WordCounter 

	class FileParser
	
		def parse_file (file)
			file = File.open(file, 'r')
			file_contents = file.read
			Parser.new.parse_string file_contents
		end
	end
end

