require_relative 'parser.rb'
module WordCounter

	class FileParser < Parser
 		def parse(filename)
 			result = File.read filename
			super result
		end
	end
end
