require 'word_counter/parser'

module WordCounter
  class FileParser < Parser
    def parse(filename)
      contents = File.read filename
      super contents
    end
  end
end
