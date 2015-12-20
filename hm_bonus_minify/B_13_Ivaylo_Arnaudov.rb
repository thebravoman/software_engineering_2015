require 'csv'
require 'date'
require 'rexml/document'
require 'net/http'
require 'openssl'

DATE_FORMAT = "%d/%m/%Y"

# Utils
class String
  def numeric?
    return true if self =~ /\A\d+\Z/
    true if Float(self) rescue false
  end
end

def download_csv(path)
  url = URI.parse(path)
  http_client = Net::HTTP.new(url.host, url.port)

  if url.scheme == 'https'
    http_client.use_ssl = true
    http_client.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  res = http_client.get(url.request_uri)

  contents = []
  CSV.parse(res.body) do |row|
    contents.push(row)
  end

  return contents
end

# Printers
def print_rows(arr)
  arr.each do |inner_arr|
    puts "#{inner_arr.join(",")}"
  end
end

def print_accounts_xml(contents)
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

def print_periods_xml(best_info)
  doc = REXML::Document.new
  root = doc.add_element('minify')
  best_info.each do |key, value|
    type_element = root.add_element(key)
    value.each do |key, value|
      type_info_element = type_element.add_element(key)
      text = value.kind_of?(Date) ? value.strftime(DATE_FORMAT) : value
      type_info_element.add_text(text.to_s)
    end
  end

  formatter = REXML::Formatters::Pretty.new(4)
  formatter.compact = true
  res = ''
  formatter.write(doc, res)
  puts "#{res}"
end

# These two are both O(n*m). Can be refactored as well - to remove redundancy,
# but it's a lot more clearer having two separate methods.
def get_best_expense_period(months_expenses, months)
  best_expense = 0
  best_expense_start_month = months_expenses.keys[0]
  best_expense_end_month = months_expenses.keys[0]
  months_expenses.each_with_index do |(key, value), index|
    current_expense = 0
    current_period_count = 0
    while (current_period_count < months) &&
          (index + current_period_count < months_expenses.length)
      current_expense += months_expenses.values[index + current_period_count]
      current_period_count += 1
    end

    if current_expense < best_expense
      best_expense = current_expense
      best_expense_start_month = key
      best_expense_end_month = months_expenses.keys[index + current_period_count - 1]
    end
  end

  return [best_expense_start_month, best_expense_end_month, best_expense]
end

def get_best_gain_period(months_gains, months)
  best_gain = 0
  best_gain_start_month = months_gains.keys[0]
  best_gain_end_month = months_gains.keys[0]
  months_gains.each_with_index do |(key, value), index|
    current_gain = 0
    current_period_count = 0
    while (current_period_count < months) &&
          (index + current_period_count < months_gains.length)
      current_gain += months_gains.values[index + current_period_count]
      current_period_count += 1
    end

    if current_gain > best_gain
      best_gain = current_gain
      best_gain_start_month = key
      best_gain_end_month = months_gains.keys[index + current_period_count - 1]
    end
  end

  return [best_gain_start_month, best_gain_end_month, best_gain]
end

def get_best_months_info(contents, months)
  date_amount = contents.map { |x| [Date.strptime(x[0], DATE_FORMAT), x[3].to_i] }
  date_amount_sorted = date_amount.sort_by { |x| x[0] }
  grp_by_month = date_amount_sorted.group_by { |x| Date.new(x[0].year, x[0].month) }
  keys_sorted = grp_by_month.sort.to_h
  months_gains = Hash.new(0)
  months_expenses = Hash.new(0)
  keys_sorted.each do |k, v|
    v.each do |v|
      amount = v[1]
      if amount > 0
        months_gains[k] += amount
      elsif amount < 0
        months_expenses[k] += amount
      end
    end
  end

  gain = get_best_gain_period(months_gains, months)
  bgp_start_month, bgp_end_month, bgp_amount = gain[0], gain[1], gain[2]
  expense = get_best_expense_period(months_expenses, months)
  bep_start_month, bep_end_month, bep_amount = expense[0], expense[1], expense[2]

  bgp_start_date = keys_sorted[bgp_start_month].first[0]
  bgp_end_date = keys_sorted[bgp_end_month].last[0]
  bep_start_date = keys_sorted[bep_start_month].first[0]
  bep_end_date = keys_sorted[bep_end_month].last[0]

  best_gain = {}
  best_gain["date_start"] = bgp_start_date
  best_gain["date_end"] = bgp_end_date
  best_gain["value"] = bgp_amount

  best_expense = {}
  best_expense["date_start"] = bep_start_date
  best_expense["date_end"] = bep_end_date
  best_expense["value"] = bep_amount

  best_info = {}
  best_info["gain"] = best_gain
  best_info["expense"] = best_expense

  return best_info
end

path = ARGV[0]
second_arg = ARGV[1]
value = ARGV[2].to_i if ARGV[2] != nil

contents = []
if path.start_with?("http://", "https://")
  contents = download_csv(path)
else
  CSV.foreach(path) do |row|
    contents.push(row)
  end
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
    best_info = get_best_months_info(contents, second_arg.to_i)
    print_periods_xml(best_info)
  elsif second_arg == 'xml' # Fourth task
    print_accounts_xml(contents)
  else # Third task
    matched = contents.select { |x| x[1] == second_arg }
    matched.sort! { |x, y| Date.strptime(x[0], DATE_FORMAT) <=> Date.strptime(
      y[0], DATE_FORMAT) }
    sum = matched.map { |x| x[3].to_i }.inject { |sum, amount| sum + amount }

    print_rows(matched)
    puts sum
  end
end
