require 'word_counter/parser'

module WordCounter
  # Parses files
  class FileParser < Parser
    def parse(filename, extension)
      file_contents = File.read filename
      # makes it work with any encoding
      file_contents = file_contents.encode 'UTF-8', 'UTF-8', invalid: :replace
      super file_contents, extension
    end
  end
end
