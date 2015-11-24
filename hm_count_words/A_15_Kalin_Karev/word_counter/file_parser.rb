require_relative './parser'

module WordCounter
	class FileParser<Parser
		def self.parse(filename)
			working_with = File.read filename
			super working_with
		
		end
	
	end

end
