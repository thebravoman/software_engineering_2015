module WordCounter
  class DirectoryParser < Parser
    def parse(start)
      Dir.foreach(start) do |filename|
        path = File.join(start, filename)
        if filename == "." or filename == ".."
          next
        elsif File.directory?(path)
          parse(path)
        else

          Dir.glob(path + "*") do |files|
            if files.split(".").last == "rb"
              content = File.read(files)
              super(content)
            end

          end
        end
      end
    end
  end
end
