date = ARGV[1]
File.open(ARGV[0], 'r') do |f|
  f.each_line do |line|
    line = line.split(' ')
    puts line.join(' ') if line[0] == date
  end
end
