require_relative 'parser.rb'

module WordCounter
  class FileParser < Parser
    def parse(filename)
      resultz = File.read filename
      super resultz
    end
  end
end
