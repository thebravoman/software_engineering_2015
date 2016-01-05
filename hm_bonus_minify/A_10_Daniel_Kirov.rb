require 'csv'

my_csv = CSV.read ARGV[0]
first_argv = ARGV[1]
second_argv = ARGV[2].to_i
sum = 0
final_array = []

if !(first_argv =~ /\d/) && !(first_argv.include? '/') && !(first_argv.include? 'xml') 
  my_csv.each do|line|
    if line[1] == first_argv
      sum += line[3].to_i
      final_array.push line.join(',')
    end
  end
  final_array.sort!
  final_array.each do |row|
    puts row
  end
  puts sum
end

if ARGV[2]
my_csv.each do |line|	
  if line[0] == first_argv && line[3].to_i.between?((second_argv-10),(second_argv+10))
    puts line.join(",")
  end
end
else 
  my_csv.each do |line|	
	if line[0] == first_argv
	  puts line.join(",")
	end
  end
end

