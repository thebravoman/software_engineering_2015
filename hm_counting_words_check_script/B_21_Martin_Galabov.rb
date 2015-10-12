require 'csv'
open("London_Bridge.txt", "w") { |s|
  s.puts"London bridge is falling down, falling down, falling down. London bridge is falling down, my fair lady."
}

CSV.open("result.csv","w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
	  name = filename.split("/").last.split("_")
	  p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
	  result= `ruby #{filename} London_Bridge.txt`
	    solved = 0
	    if result=="down,4\nfalling,4\nbridge,2\nis,2\nlondon,2\nfair,1\nlady,1\nmy,1\n"
		    solved = 1
	    end
		  csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
  end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! {|a,b| a[0] <=> b[0]}
CSV.open("result.csv", "w") do |csv|
  my_csv.each{|element| csv << element }
end
