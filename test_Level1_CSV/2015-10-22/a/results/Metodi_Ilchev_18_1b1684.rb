require "csv"

FIRST=ARGV[0]
lnames=[]
fnames=[]
Dir.glob(FIRST+"*.rb").each{
	|fname|
	fname=fname.split('/').last

	lname=fname.split('_')[1]
	if lname.size==10
		fnames<<fname
	end
}
fnames.sort!{
|beef,jerky| beef.split("_")[1].downcase <=> jerky.split("_")[1].downcase
}
CSV.open("result.csv","w") do |line|
	fnames.each {|item| line << [item.split('_')[0],item.split('_')[1]]}
end