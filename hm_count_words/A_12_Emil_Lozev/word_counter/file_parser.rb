require_relative './parser'

module WordCounter
	class FileParser < Parser
		def self.parse(filename)
			$file = filename
			res = ""
			res = open(filename).read
			super res
		end
	end
end
