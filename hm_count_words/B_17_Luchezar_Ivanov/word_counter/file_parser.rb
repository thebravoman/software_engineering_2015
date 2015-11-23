module WordCounter
	class FileParser < Parser
		def file_parse(filename)
			filename = File.open(filename, 'r')
			file_content = filename.read
			#super(file_content)
			parse(file_content)
		end
	end
end
