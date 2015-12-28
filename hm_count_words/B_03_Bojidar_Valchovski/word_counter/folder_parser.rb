module WordCounter
  class FolderParser < Parser
	def initialize
	  @res = ''
	end

	def parse(path)
	  Dir.glob(path+"**/"+"*").each do |file|
        @res << File.read(file)
      end
	  super(@res)
	end
  end
end
