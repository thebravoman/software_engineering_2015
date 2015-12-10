file = ARGV[0]
sec_argv = ARGV[1]
value = ARGV[2].to_i

file = File.open(file, 'r') do |f|
  f.each_line do |line|
    line = line.split(' ')
    amount = line[3].to_i
    puts line.join(',') if line[0] == sec_argv && (amount >= value-10 && amount <= value+10)
  end
end
