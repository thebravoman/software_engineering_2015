module WordCounter 

	class FileParser
	
		def parse_file (file)
			files = File.open(file, 'r')
			file_contents = files.read
			Parser.new.parse_string file_contents
		end
	end
end

