require_relative 'minify_printer.rb'

class MinifyAccountPrinter < MinifyPrinter
  def self.print_account_output(csv, account)
    output = []
    sum = 0.0

    csv.each do |row|
      if row[ACCOUNT_COLUMN] == account
        output << row
        sum += row[AMOUNT_COLUMN].to_f
      end
    end

    output.sort_by! do |row| 
      date = row[DATE_COLUMN].split '/'
      [date[2].to_i, date[1].to_i, date[0].to_i]
    end

    print_csv output
    puts sum.round 2 if output.size > 0
  end
end