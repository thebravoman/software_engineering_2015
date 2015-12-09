require 'csv'

date = ARGV[1]
CSV.foreach(ARGV[0]) do |line|
  if line[0].include? date
    puts line
  end
end
