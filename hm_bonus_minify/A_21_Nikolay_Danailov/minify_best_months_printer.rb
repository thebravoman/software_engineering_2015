require 'rexml/document'
require_relative 'minify_printer.rb'

class MinifyBestMonthsPrinter < MinifyPrinter
  def self.get_month_data(csv)months = []
    i = 0
    while i < csv.size
      date = csv[i][DATE_COLUMN].split '/'
      month = "#{date[1]}/#{date[2]}"
      current_month = month
      start_date = csv[i][DATE_COLUMN]
      current_date = start_date
      gain = 0
      expense = 0

      while current_month == month && i < csv.size
        current_date = csv[i][DATE_COLUMN]
        value = csv[i][AMOUNT_COLUMN].to_f

        if value > 0
          gain += value
        elsif value < 0
          expense += value
        end

        i += 1

        if i < csv.size
          date = csv[i][DATE_COLUMN].split '/'
          month = "#{date[1]}/#{date[2]}" if i < csv.size
        end
      end

      #          start date, end date,     gain, expense
      months << [start_date, current_date, gain, expense]
    end

    months
  end

  def self.month_in_range? months, i, j, wanted_months
    month_and_year_1 = [months[i][0].split('/')[1], months[i][0].split('/')[2]]
    month_and_year_2 = [months[j][0].split('/')[1], months[j][0].split('/')[2]]

    year_diff = month_and_year_2[1].to_i - month_and_year_1[1].to_i
    month_diff = month_and_year_2[0].to_i - month_and_year_1[0].to_i
    all_diff = year_diff * 12 + month_diff

    # puts all_diff
    # puts "#{month_and_year_1} = #{month_and_year_2}"

    all_diff < wanted_months
  end

  def self.get_best_months(months, wanted_months)
    best_months = Hash.new(0)
    best_months[:gain_value] = months[0][2]
    best_months[:gain_start_date] = months[0][0]
    best_months[:gain_end_date] = months[0][1]
    best_months[:expense_value] = months[0][3]
    best_months[:expense_start_date] = months[0][0]
    best_months[:expense_end_date] = months[0][1]

    i = 0
    while i < months.size - wanted_months
      last_checked_month = months[i]
      gain_sum = 0
      expense_sum = 0
      j = i

      while j < i + wanted_months
        if month_in_range?(months, i, j, wanted_months)
          gain_sum += months[j][2].to_i
          expense_sum += months[j][3].to_i
          last_checked_month = months[j]
        end

        j += 1
      end

      if gain_sum > best_months[:gain_value]
        best_months[:gain_value] = gain_sum
        best_months[:gain_start_date] = months[i][0]
        best_months[:gain_end_date] = last_checked_month[1]
      end

      if expense_sum >= best_months[:expense_value]
        best_months[:expense_value] = expense_sum
        best_months[:expense_start_date] = months[i][0]
        best_months[:expense_end_date] = last_checked_month[1]
      end

      i += 1
    end

    best_months
  end

  def self.print_best_months(csv, wanted_months)
    csv.sort_by! do |row|
      date = row[DATE_COLUMN].split('/').map(&:to_i)
      [date[2], date[1], date[0]]
    end

    months = get_month_data csv
    result = get_best_months months, wanted_months
    print_csv months
    puts result
  end
end