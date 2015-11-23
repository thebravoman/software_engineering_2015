module Word_counter
class FileParser < Parser
	def parse(path)
		my_array = ""
		File.open(path, "r").each_line do |line|
			my_array += " " + line.downcase
		end
		super(my_array)
	end
end
end


