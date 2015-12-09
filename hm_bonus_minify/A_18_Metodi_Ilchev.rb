require 'CSV'

file=ARGV[0]
date=ARGV[1]
value=ARGV[2].to_f

moni=3 #Money Index, didn't notice it sounds like ai habe kanser

table=[]
sum=0

#ROW.first should return the date for the CSV
#ROW.last returns the description
#Random newlines are left for future expansions

CSV.foreach(file){
|r|
	
	if r.first == date
		
		if (r[3].to_f>=value-10 and r[3].to_f<=value+10)
			
			table.insert(0,r)
			#puts "ISNERTED A DILDO" #DEBUG MESSAGE PLEASE IGNORE
		end
	end
}

table.sort!{|x,y| x.first <=> y.first}

table.each{
|e|
	
	puts e.inspect
	sum=sum+e[moni].to_i
}
puts "Grand total for that date is: #{sum}"