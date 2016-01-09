require_relative 'file_parser'

module WordCounter
	class FolderParser
		def parse_folder folder
			directory = folder.gsub("\n",'')
			directory.insert(directory.size, '/**/*.*')
			Dir.glob(directory).each do |file|
				result = FileParser.new.parse_file file
			end
		end
	end
end
