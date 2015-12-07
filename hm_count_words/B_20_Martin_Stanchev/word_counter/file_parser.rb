module WordCounter
  class FileParser < Parser 
    def parse(filename)
      content = File.read(filename)
      
      super(content)
    end
  end
end
