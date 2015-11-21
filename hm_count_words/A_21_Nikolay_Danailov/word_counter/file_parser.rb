require 'word_counter/parser'

module WordCounter
  # Parses files
  class FileParser < Parser
    def self.parse(file)
      file_contents = File.read(file)
      # makes it work with any encoding
      file_contents = file_contents.encode('UTF-8', 'UTF-8', invalid: :replace)
      super file_contents
    end
  end
end
