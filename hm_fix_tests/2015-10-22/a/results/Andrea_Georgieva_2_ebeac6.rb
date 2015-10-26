require 'csv'

v1 = ARGV[0]
v2 = ARGV[1]

a1 = []
a2 = []

Dir.glob(ARGV[0] + "*").each do |fil1|
  name1 = fil1.split("/").last.split("_")
  a1 << [name1[1],name1[0]]
end
Dir.glob(ARGV[1] + "*").each do |fil2|
  name2 = fil2.split("/").last.split("_")
  a2 << [name2[1],name2[0]]
end
 ima = false
  array = []
  puts a1
  puts a2
  a1.each do |file1|
    ima = false
    a2.each do |file2|
      if (file1[0] == file2[0]) && (file1[1] == file2[1])
        ima = true
      end
    end
    if (ima == false)
      array << file2
      end
  end
  array.sort!{|a,b| a[0] <=> b[0]}
  CSV.open("result.csv","w") do |csv_array|
    array.each do |line|
      csv_array << line
    end
  end
