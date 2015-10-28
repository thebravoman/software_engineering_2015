require 'csv'
folder1 = ARGV[0]
folder2 = ARGV[1]
my_csv = []
my_csv1 = []
my_csv2 = []

Dir.glob(folder1 + '*').each do |file|
  filename = file.split("/").last.split("_")
  my_csv1 << [filename[1], filename[0]]#, filename[2].split(".").first]

end

Dir.glob(folder2 + '*').each do |file|
  filename = file.split("/").last.split("_")

  my_csv2 << [filename[1], filename[0]] #, filename[2].split(".").first]

end




my_csv1.each do |file1|
  bol = false
  my_csv2.each do |file2|
    if(file1[0] == file2[0]) && (file1[1] == file2[1])
      bol = true
    end
  end
    if bol == false
      my_csv << file1
    end



end



  my_csv.sort! {|a,b| a[1] <=> b[1]}
  my_csv.reverse!
  CSV.open('result.csv', 'w') do |csv|
    my_csv.each do |line|
    csv << line
  end

end
