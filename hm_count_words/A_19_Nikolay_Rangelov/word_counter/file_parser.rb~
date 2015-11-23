require_relative './parser'

module WordCounter
	class FileParser < Parser
    	def self.parse(filename)
    		@filename = filename
    		file_content = " "
			f = File.open(@filename, "r")
			f.each_line do |line|
				file_content = file_content + " " + line
			end

			 result = Parser.parse(file_content)
			 return result
    	end
 	end
end
