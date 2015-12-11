file = ARGV[0]
sec_argv = ARGV[1]
value = ARGV[2]
$is_there_value = false

def check_value value
  if value.nil?
    $is_there_value = false
  else
    $is_there_value = true
  end
end

check_value value

file = File.open(file, 'r') do |f|
  f.each_line do |line|
    line = line.split(' ')
    amount = line[3].to_i
    if line[0] == sec_argv && !$is_there_value
      puts line.join(',')
    elsif line[0] == sec_argv && $is_there_value && (amount >= value.to_i-10 && amount <= value.to_i+10)
      puts line.join(',')
    end
  end
end
