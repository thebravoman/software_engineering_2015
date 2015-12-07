module WordCounter
	class FileParser < Parser
		def parse_file(filename)
			file_content = filename.read
			parse file_content
		end
	end
