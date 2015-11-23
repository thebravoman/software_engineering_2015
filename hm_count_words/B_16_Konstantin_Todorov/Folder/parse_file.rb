module WordCounter
def parse_file(filename)
	text = ''
	File.open(filename) do |file|
		file.each_line do |line|
			text += line
		end
	end
	parse text
end
end
