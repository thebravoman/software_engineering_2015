require 'csv'

open('sample_text.txt', 'w') { |f|
	f.puts"Doing my homework is as easy as this."
}

CSV.open("result.csv","a") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	if name[0] != "sample.txt" 
      p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
	  result= `ruby #{filename} sample_text.txt`
	  solved = 0
	  if result.gsub("\n","")=="as,2doing,1easy,1homework,1is,1my,1this,1"
	    solved = 1
	  end
	  if result.gsub("\n","")== "as,2Doing,1easy,1homework,1is,1my,1this,1"
		solved = 1
	  end
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
  end
end

csv_reader = CSV.read 'result.csv'
csv_reader.sort!{ |a,b| [a[0], a[1].to_i] <=> [b[0], b[1].to_i]}

CSV.open("result.csv","w") do |csv|
  csv_reader.each { |line| csv << line }
end
