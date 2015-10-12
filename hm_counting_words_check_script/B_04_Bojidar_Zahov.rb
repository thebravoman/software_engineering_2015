require 'csv'

open('text.txt', 'w') { |s|
  s.puts"How to checkout to a specific date in github"
}
Dir.glob(ARGV[0]+"*").each do |filename|
        name = filename.split("/").last.split("_")
        p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
        result= `ruby #{filename} text.txt `
        CSV.open("result.csv","w") do |csv|
           solved = 0
           if result == "how,1\ncheckout,1\na,1\nspecific,1\ndate,1\nin,1\ngithub,1\nto,2\n"
               solved = 1
           end
        csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
    end
end

my_csv = CSV.read "result.csv"
my_csv.sort! {|a,b| a[0] <=> b[0] }
CSV.open("result.csv","w") do |csv|
  my_csv.each {|element| csv<< element}
end
