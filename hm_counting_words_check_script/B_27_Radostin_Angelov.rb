require 'csv'
CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |file|
    if not file.include? '~'
      name = file.split("/").last.split("_")
      p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
      result= `echo "boat boat boat horse boat horse tree tree" > "input.txt" && ruby #{file} ../hm_counting_words_check_script/input.txt`
#chech_homeworks/input.txt
      solved = 0
      if file.include? 'B_14' or file.include? 'B_25'
        p result
      end
      if result == "boat,4\nhorse,2\ntree,2\n"
        solved = 1
      end
      csv << [name[0],name[1],name[2],name[3],solved]
    end
  end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! {|a, b| a[0].to_i <=> b[0].to_i}
#csv.each {|line| csv << line}
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|line| csv << line}
end
