require_relative 'printer.rb'
require 'rexml/document'

class MonthsPrinter < Printer
	private
	def self.get_amount_sum csv, begin_row, end_year, end_month, positive_sign
		end_date = ""
		#puts "Getting from row #{begin_row} to #{end_month}/#{end_year}"
		sum = 0
		counter = begin_row
		while counter < csv.size
			row = csv[counter]
			date = row[DATE_COLUMN]
			split_date = date.split '/'
			year = split_date[2].to_i
			month = split_date[1].to_i
			if end_month==3 && end_year==2001
				#puts "year #{year}; end_year #{end_year}; month #{month}; end_month #{end_month}"
				#puts "#{year>end_year || (year==end_year && month>end_month)}"
			end
			if year>end_year || (year==end_year && month>end_month)
				#puts "braking";
				break
				#puts 'didnt break'
			end
			amount = row[AMOUNT_COLUMN].to_f
			if (amount>0&&positive_sign)||(amount<0&&!positive_sign)
				sum += amount
				end_date = row[DATE_COLUMN]
			end
			counter += 1
		end
		[sum, end_date]
	end

	def self.get_max_sum csv, months, positive_sign
		max_begin_date = "unknown"
		max_end_date = "unknown"
		counter = 0
		current_year = -1
		current_month = -1
		max = 0
		while counter < csv.size
			prev_year = current_year
			prev_month = current_month
			row = csv[counter]
			date = row[DATE_COLUMN]
			split_date = date.split '/'
			current_year = split_date[2].to_i
			current_month = split_date[1].to_i
			amount = row[AMOUNT_COLUMN].to_f
			if ( current_year!=prev_year || current_month!=prev_month ) && ( (amount>0&&positive_sign) || (amount<0&&!positive_sign) )
				begin_date = date
				end_date = String.new
				sum, end_date = get_amount_sum csv, counter, current_year + ((current_month+months-2)/12).floor, (current_month+months-2)%12+1, positive_sign
				if (max<sum&&positive_sign) || (max>sum&&!positive_sign)
					max = sum
					max_begin_date = begin_date
					max_end_date = end_date
				end
			end
			counter += 1
		end
		[max, max_begin_date, max_end_date]
	end

	public
	def self.print csv, months_str
		csv.sort_by! { |row| [ ConvertDate(row[DATE_COLUMN]) ] }
		months = months_str.to_i
		xml = REXML::Document.new
		minify_element = xml.add_element 'minify'

		begin_date = String.new
		end_date = String.new

		gain_el = minify_element.add_element 'gain'
		max, begin_date, end_date = get_max_sum csv, months, true
		gain_el.add_element('date_start').text = begin_date
		gain_el.add_element('date_end').text = end_date
		gain_el.add_element('value').text = max
		#puts "max = #{max}; begin = #{begin_date}; end = #{end_date}"

		expense_el = minify_element.add_element 'expense'
		max, begin_date, end_date = get_max_sum csv, months, false
		expense_el.add_element('date_start').text = begin_date
		expense_el.add_element('date_end').text = end_date
		expense_el.add_element('value').text = max
		print_xml xml
		#print_csv csv
	end
end
