module WordCounter
  class DirectoryParser < Parser
    def initialize
      @content = ''
    end

    def parse(start)
      Dir.foreach(start) do |filename|
        path = File.join(start, filename)
        if filename == "." or filename == ".."
          next

        elsif File.directory?(path)
          parse(path)

        else
          if path.split(".").last == "cc"
            @content << File.open(path, "r").read
            puts path
          end
        end

      end
      super @content
    end
  end
end
