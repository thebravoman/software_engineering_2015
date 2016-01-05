module WordCounter
  class FolderTraverser
    def initialize
      @text = ""
    end

    def get_text
      return @text
    end

    def traverse(path)
      Dir.glob("#{path}/*").each_with_object({}) do |f, h|
        if File.file?(f)
          @text << File.read(f)
        elsif File.directory?(f)
          @text = traverse(f)
        end
      end
    end
  end
end
