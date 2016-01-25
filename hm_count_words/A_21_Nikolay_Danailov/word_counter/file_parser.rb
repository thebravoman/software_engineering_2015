require 'word_counter/parser'

module WordCounter
  # Parses files
  class FileParser < Parser
    def parse(filename)
      db_res = get_res_from_for_file filename

      unless db_res.nil?
        db_res
      else
        file_contents = File.read(filename)
        # makes it work with any encoding
        file_contents = file_contents.encode('UTF-8', 'UTF-8', invalid: :replace)
        temp = super file_contents
        save_res_to_db temp, filename
        temp
      end
    end
  end
end
