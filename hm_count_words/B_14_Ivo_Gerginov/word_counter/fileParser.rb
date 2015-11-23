module WordCounter
  class FileParser
  	def parseFile(f_path)
  	  f = File.open(f_path, 'r')
	  f = f.read
	  WordCounter::parseStr f
    end
  end
end