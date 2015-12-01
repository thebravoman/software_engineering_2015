require 'json'

json = File.read("A_3_Antonio_Mindov.json");
parsed = JSON.parse(json)

parsed.each do |school, props|
	puts props["name"].to_s
	props["classes"].each do |clazz|
		puts "  " + clazz[name]
		clazz["students"].each do |student|
			puts "    " + student
		end
	end
end
