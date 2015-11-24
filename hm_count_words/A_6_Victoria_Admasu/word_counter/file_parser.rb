require_relative 'parser'

module WordCounter 
	class FileParser < Parser
		def parse(filename)
			text = ''
			text = File.read (filename)

			super text
		end
	end
end