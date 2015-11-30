require_relative 'parser'
module WordCounter
class Parse
def parse_file(file_path)
		text = File.open(file_path, "r")
		Parse.new.parse(text.read)
end
end
end
