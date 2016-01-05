require_relative './parser'

module WordCounter
	class FileParser < Parser
		def parse(filename)
			c = File.read filename
			super c
		end
	end
end
