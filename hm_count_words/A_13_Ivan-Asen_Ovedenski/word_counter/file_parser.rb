require 'word_counter/parser.rb'

module WordCounter 
	class FileParser < Parser
		def self.parse(file)
			text = File.open(file, "r")
			super (text)
		end
	end
	
end
