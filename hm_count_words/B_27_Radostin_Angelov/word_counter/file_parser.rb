module WordCounter
    class FileParser < Parser
    	def parse(filename)
    	    file = File.open(filename, 'r')
    	    content = file.read.downcase
    	    file.close

    	    super(content, filename)
    	end
    end
end
