require 'csv'

File.new("test.txt")
File.open("test.txt", "w") { |test|
	test.puts "Right here in the darkness there's nothing left for me to do it's easier to run away but today, today we got to"
}

CSV.open("result.csv","w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
    name = filename.split("/").last.split("_")
    p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
    result = `ruby #{filename} test.txt`
    solved = 0
    if result == "s,2\nto,2\naway,2\nbut,2\ndarkness,2\ndo,2\neasier,2\nfor,2\ngot,2\nhere,2\nin,2\nit,2\nleft,2\nme,2\nnothing,2\nright,2\nrun,2\nto,2\ntoday,2\nthere,2\nwe,2\n"
      solved = 1
    end
    csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
  end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| (a[0] == b[0]) ? (a[1] <=> b[1]) : (a[0] <=> b[0]) }
CSV.open("result.csv", "w") do |csv|
        my_csv.each {|element| csv << element}
end