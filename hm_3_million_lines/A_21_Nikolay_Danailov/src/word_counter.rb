require 'word_counter/folder_parser'

# Handles word counting
module WordCounter
  def self.parse_folder(folder, extension)
    FolderParser.new.parse folder, extension
  end
end
