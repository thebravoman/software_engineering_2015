require'parser.rb'

module WordCounter
  class FileParser < Parser
    def parse(filename)
      res = File.read filename
      super res
    end
  end
end