require 'csv'
require 'date'
require 'rexml/document'

DATE_FORMAT = "%d/%m/%Y"

class String
  def numeric?
    return true if self =~ /\A\d+\Z/
    true if Float(self) rescue false
  end
end

def print_rows(arr)
  arr.each do |inner_arr|
    puts "#{inner_arr.join(",")}"
  end
end

def print_xml(contents)
  doc = REXML::Document.new
  root = doc.add_element('minify')
  grouped_by_acc = contents.group_by { |x| x[1] }.sort.to_h
  grouped_by_acc.each do |acc, details|
    acc_element = root.add_element('account')
    acc_element.add_text(acc)

    sorted_by_date = details.group_by { |x| x[0] }.sort_by { |k, v| Date.parse(k) }.to_h
    sorted_by_date.each do |date, value|
      date_element = acc_element.add_element('date')
      date_element.add_text(date)

      sorted_by_amount = value.map { |x| x[3] }.sort_by { |x| x.to_i }
      sorted_by_amount.each do |amount|
        amount_element = date_element.add_element('amount')
        amount_element.add_text(amount)
      end
    end
  end

  formatter = REXML::Formatters::Pretty.new(4)
  formatter.compact = true
  res = ''
  formatter.write(doc, res)
  puts "#{res}"
end

filename = ARGV[0]
second_arg = ARGV[1]
value = ARGV[2].to_i if ARGV[2] != nil

contents = []
CSV.foreach(filename) do |row|
  contents.push(row)
end

# Remove headers
contents.shift

begin
  date = Date.strptime(second_arg, DATE_FORMAT)
  if value == nil # First task
    matched = contents.select { |x| Date.strptime(x[0], DATE_FORMAT) == date }
  else # Second task
    matched = contents.select { |x| Date.strptime(x[0], DATE_FORMAT) == date &&
                                x[3].to_i >= value - 10 && x[3].to_i <= value + 10 }
  end
  print_rows(matched)
rescue ArgumentError
  if second_arg.numeric? # Sixth task
  elsif second_arg == 'xml' # Fourth task
    print_xml(contents)
  else # Third task
    matched = contents.select { |x| x[1] == second_arg }
    matched.sort! { |x, y| Date.strptime(x[0], DATE_FORMAT) <=> Date.strptime(
      y[0], DATE_FORMAT) }
    sum = matched.map { |x| x[3].to_i }.inject { |sum, amount| sum + amount }

    print_rows(matched)
    puts sum
  end
end
