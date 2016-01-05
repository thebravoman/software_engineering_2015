module WordCounter
  class FolderParser < Parser
	def initialize
	  @res = ''
	end

	def parse(path)
	  Dir.glob(path+"**/"+"*").each do |file|
		if File.file? file         
		  @res << File.read(file)
        end
      end
	  super(@res)
	end
  end
end
