module WordCounter
  class FileParser < Parser
    def parse_file(filename)
      $a = filename
      result = File.open(filename,'r')
      smth_new = result.read
      Parser.new.parse smth_new
    end
  end
end
