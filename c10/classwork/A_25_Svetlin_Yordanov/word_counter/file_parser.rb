class FileParser < Parser
	f = file.open(filename, "r")
	string = " "
	f.each do |line|
		string += line
	end
	parse string
end
