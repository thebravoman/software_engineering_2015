require 'csv'

@my_csv = []

def working folder
    Dir.glob(folder + '*').each do |file|
          f = file.split("/").last
          a = f.to_s.gsub(/[^_]/,'')
   
          if !(a == "__") 
     	     	       
         	 	n_size = f.size
           		@my_csv << [f,n_size]
     
          end
     end 
end

def open_csv 
     CSV.open('result.csv', 'w') do |csv|   
          @my_csv.each { |line| csv << line } 
          end
end

def sort_csv
     @my_csv.sort! do |a, b| 
     	(a[1] == b[1]) ? (a[0] <=> b[0]): (b[0] <=> a[0])
     end
	@my_csv.uniq!
end

working ARGV[0]

working ARGV[1]

sort_csv

open_csv
