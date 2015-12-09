file_path = ARGV[0]
account = ARGV[1]

matching_accounts = []
matching_amount = 0
File.readlines(file_path).each do |line|
   line_details = line.split(',')
   line_account = line_details[1]
   line_amount = line_details[3].to_f

   if (line_account == account)
     matching_accounts.push(line)
     matching_amount += line_amount
   end
end

puts matching_accounts
puts matching_amount.to_i
