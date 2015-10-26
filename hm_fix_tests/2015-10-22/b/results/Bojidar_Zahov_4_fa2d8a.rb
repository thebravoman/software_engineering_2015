require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

my_csv = []
Dir.glob(folder1 + '*').each do |file|
     f = file.split("/").last
     ar = f.split("_")
     a = f.to_s.gsub(/[^_]/,'')
   
     if !(a == "__") 
     	     	       
         	n_size = f.size
           	my_csv << [f,n_size]
    
     end
end
Dir.glob(folder2 + '*').each do |file|
     f = file.split("/").last
     ar = f.split("_")
     a = f.to_s.gsub(/[^_]/,'')
   
     if !(a == "__") 
     	     	       
         	n_size = f.size
           	my_csv << [f,n_size]
     
     end
end

my_csv.sort! do |a, b| 
	(a[1] == b[1]) ? (a[0] <=> b[0]): (b[0] <=> a[0])
end
my_csv.uniq!


CSV.open('result.csv', 'w') do |csv|
  my_csv.each { |line| csv << line } 
end
