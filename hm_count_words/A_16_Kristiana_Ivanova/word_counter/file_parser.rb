require 'word_counter/parser'

module WordCounter
  class FileParser < Parser
    def self.parse(filename)
      res = File.read(filename)
      res = res.encode('UTF-8', 'UTF-8', invalid: :replace)
      super res
    end
  end
end