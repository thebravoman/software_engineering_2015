Dir.glob(ARGV[0]+"*").each do |filename|
	name = p filename.split("/").last.split("_")
	p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
end
