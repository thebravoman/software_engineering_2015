require 'csv'
require 'date'
require 'rexml/document'
require 'net/http'
require 'openssl'
require 'sanitize'

DATE_FORMAT = "%d/%m/%Y"

file = ARGV[0]
date_or_string = ARGV[1]
value = ARGV[2]

def valid_date? date_or_string
    /\d{1,2}\/\d{1,2}\/\d*/.match date_or_string
end

def is_number?(value)
  true if Float(value) rescue false
end

def is_months? date_or_string
    /[0-9]/.match date_or_string
end

def print_and_sort_string (file, date_or_string) 
    amount_value = 0.0
    array = []
    file.each do |row|
        if row[1] == date_or_string
            amount_value += row[3].to_f
            array << row
        end
    end

    array.sort_by! do |row| 
      date = row[0].split '/' 
      [date[2].to_i, date[1].to_i, date[0].to_i]
    end
    array.each do |row|
        puts row.join(",")
    end
    puts amount_value.round 2
end

def xml_output_print file
    file.sort_by! do |row|
        date = row[0].split("/")
        [row[1], date[2].to_i, date[1].to_i, date[0].to_i, row[3]]
    end
    array = []
    xml = REXML::Document.new  
    minify = xml.add_element('minify')
    
    array = file[0][1]
    account = minify.add_element("account")
    account.add_attribute("", "#{array}")
    
    temp_date = file[0][0]
    
    file.each do |element|
        if element[1] == array  
            if element[0] != array
                date = account.add_element("date")
                date.add_attribute("", "#{element[0]}")
                
                amount = date.add_element("amount")
                amount.add_attribute("", "#{element[3]}")
            else 
                array = element[0]
                amount = date.add_element("amount")
                amount.add_attribute("", "#{element[3]}")
            end 
        elsif element[1] != array
            array = element[1]
            account = minify.add_element("account")
            account.add_attribute("", "#{element[1]}")
            
            date = account.add_element("date")
            date.add_attribute("", "#{element[0]}")
            
            amount = date.add_element("amount")
            amount.add_attribute("", "#{element[3]}")
        end
    end
    out = ''
    xml.write(out, 2)
    puts out 
end

def get_contents str
  if !str.start_with?("http://", "https://")
    CSV.read(str)[1..-1]
  else
    url = URI.parse(str)
    http = Net::HTTP.new(url.host, url.port)

    if url.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    contents = http.get(url.request_uri)
    text = Sanitize.clean(contents.body, remove_contents: ['script', 'style'])
    CSV.parse(text)[1..-1]
  end
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

csv = get_contents file #version 5
date = Date.strptime(date_or_string, DATE_FORMAT)

if date_or_string == 'xml' #version 4
    xml_output_print(csv)
elsif is_months? date_or_string #version 6
    best_info = get_best_months_info(csv, date_or_string.to_i)
    print_periods_xml(best_info)
else #version 3
    if !valid_date?(date_or_string)
        print_and_sort_string(csv,date_or_string)
    else #version 2
        if is_number? value
            value = value.to_i
            csv.each do |row|
                if row[0] == date_or_string && row[3].to_i >= (value-10) && row[3].to_i <= (value+10)
                    puts row.join(",")
                end
            end
        else #version 1
            csv.each do |row|
                if row[0] == date_or_string
                    puts row.join(",")
                end
            end
        end
    end
end