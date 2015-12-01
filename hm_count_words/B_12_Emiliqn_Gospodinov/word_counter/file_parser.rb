module WordCounter
  class FileParser < Parser
    def parse(filename)
      text = File.read(filename)
      super(text)
    end
  end
end
