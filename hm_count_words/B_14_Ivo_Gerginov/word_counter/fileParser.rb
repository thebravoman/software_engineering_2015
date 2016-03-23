module WordCounter
  
  class FileParser
  
  	def parseFile(fPath)
  	  f = File.open(fPath, 'r')
	  f = f.reat
	  WordCounter::parsestr(f, fPath)
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
  	  travdir(fPath)
  	  WordCounter::parseStr(@content, fPath)
  	end
  end
end