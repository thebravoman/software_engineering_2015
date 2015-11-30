module WordCounter
  class FileParser < Parser
    def parse(filepath)
      text = File.read(filepath)
      super(text)
    end
  end
end
