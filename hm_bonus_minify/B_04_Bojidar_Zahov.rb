file  = ARGV[0]
date  = ARGV[1]
value = ARGV[2].to_i
require 'csv'
#def is_date? date_in
#	/\d{1,2}\/\d{1,2}\/\d*/.match date_in
#end
sum = 0
aaa = date.gsub(/^\//,'')
write = []
if !(aaa == "///" || aaa == "xml") 
   # CSV.open('B_04_Bojidar_Zahov.csv', 'w') do |write|
     csv = CSV.read file
	csv.each do |row|
		if row[1].to_s == aaa 
		     #if row[3].to_i.between?(value-10, value+10)
			    # puts row.join(",")
			          write << [row.join(",")]
			          sum+=row[3].to_i
			          
		    # end
		end
	#end
	
end
puts write.sort!{|a,b| a[0] <=> b[0]}
	puts sum
end

CSV.open('B_04_Bojidar_Zahov.csv', 'w') do |write|
     csv = CSV.read file
	csv.each do |row|
		if row[0] == date 
		     if row[3].to_i.between?(value-10, value+10)
			     puts row.join(",")
			          write << [row.join(",")]
			    
		     end
		end
	end
end
