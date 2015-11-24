require_relative 'parser'

module WordCounter
  class FileParser < Parser
    def parse(filename)
      super(IO.read(filename).downcase)
    end
  end
end
