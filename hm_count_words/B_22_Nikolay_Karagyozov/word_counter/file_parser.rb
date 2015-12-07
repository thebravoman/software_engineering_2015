module WordCounter
  class FileParser < Parser
    def parse(filename)
      fileContent = File.read(filename)
      super(fileContent)
    end
  end
end
