module WordCounter
	class FolderParser < Parser
		def initialize
			@content = ""
		end

		def parse(path)
			read_all_files(path)
			super(@content, path)
		end

		def read_all_files path
			Dir.foreach(path) do |item|
				current_item = path + '/' + item
				next if item == '.' or item == '..'
				if File.directory? current_item
					#p 'FOLDER: ' current_item
					read_all_files(current_item)
				else
					@content += File.read(current_item)
					@content += " "
				end
			end
		end
	end
end
