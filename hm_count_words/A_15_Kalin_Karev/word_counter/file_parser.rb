require_relative './parser'

module WordCounter
	class FileParser < Parser
		def self.parse(filename)
			@filename=filename
			file_in=" "
			fil=File.open(@filename,"r")
			
			fil.each_line do |l|
				file_in=file_in + " " + l
			end
			
			answer=Parser.parse(file_in)
			return answer
		
		end
	
	end

end
