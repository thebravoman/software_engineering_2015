require'csv'

dir1 = ARGV[0]
dir2 = ARGV[1]
CSV.open('result.csv', 'w') do |csv|
Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	first = name[0]
	last = name[1]
Dir.glob(ARGV[1]+"*").each do |filename2|
	name2 = filename2.split("/").last.split("_")
	first2 = name2[0]
	last2 = name2[1]
	end
	if first != first2 && last != last2 do
	csv<< "#{last},#{first},#{i}"
		i++
	end
	end
	end
	
