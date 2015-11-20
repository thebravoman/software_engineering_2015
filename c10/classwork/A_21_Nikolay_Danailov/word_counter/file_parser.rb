require_relative 'parser.rb'

module WordCounter
  class FileParser < Parser
    def parse(file)
      contents = File.read file
      super contents
    end
  end
end