module word_Count
  class FileParser < Parser
    def parse(path)
      text = File.read(path)
      super(content)
    end
  end
end
