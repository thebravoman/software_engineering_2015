require_relative 'parser.rb'

module WordCounter
  class FileParser < Parser
    def parse(path)
      _path = path

  	  result = ''
	  file = File.open(_path)
	  file.each_line do |line|
	    result += line
	  end
	  
      result = result.downcase	  
	  super result
    end
  end
end
