require 'word_counter/parser'

module WordCounter
  class FileParser < Parser
    def parse(filename)
      file = File.read(filename)
      file = file.encode('UTF-8', 'UTF-8', invalid: :replace)
      super file
    end
  end
end