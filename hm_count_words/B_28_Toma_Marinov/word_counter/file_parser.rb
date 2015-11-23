require_relative './parser'

module WordCounter
	class FileParser < Parser
		def parse_file(filename)
			result = File.open(filename, 'r')
			result = result.read

			parse(result)
		end
	end
end