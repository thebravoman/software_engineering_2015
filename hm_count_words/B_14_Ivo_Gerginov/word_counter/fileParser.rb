module WordCounter
  
  class FileParser
  
  	def parseFile(fPath)
  	  f = File.open(fPath, 'r')
	  f = f.read
	  WordCounter::parseStr f
    end
  end

  class FolderParser
  	
  	def initialize
  	  @content = ''
  	end

  	def travDir(fPath)
  	  Dir.glob("#{fPath}/*").each do |f|
        if File.file?(f)
        	file = File.open(f, 'r')
        	file.each do |line|
          	  @content << line
          	end
        elsif File.directory?(f)
          @content = travDir(f)
        end
  	  end
  	end

  	def parseFolder(fPath)
  	  travDir(fPath)
  	  WordCounter::parseStr(@content)
  	end
  end
end