require 'csv'
require 'rexml/document'

module Monefy
	class CSVParser
	
		def initialize
			@csv = []
			@arg_2 = ARGV[1]
			@arg_3 = ARGV[2]
			@result = []
			@date = ""
			@account = ""
			@category = ""
			@amount = 0
			@currency = ""
			@description = ""
			@sum_amount = 0
			@xml_created = false
			@xml_doc = ""
			@tags = ""
			@v6 = false
			@hash = {}
			@counter = 0
			@entry_date = ""
			@end_date = ""
			@array = []
			@previous_date = ""
			@current_day = ""
			@current_month = ""
			@current_year = ""
			@current_month_year = ""
			@date_array = []
		end
	
		def parse_csv(file)
			read_csv(file)
		end
	
		def is_empty(str)
			str.nil?
		end
		
		def is_number(str)
				!str.match(/[^0-9]/)
		end
	
		def is_date(str)
			str.match(/\d{2}\/\d{2}\/\d{4}/)
		end
	
		def sort_by_date(csv)
			csv.sort_by! do |row|
				date_split = row[0].split('/')
				[date_split[2].to_i,date_split[1].to_i,date_split[0].to_i]
			end
			csv
		end
		
		def sort_by_all(csv)
			csv.sort_by! do |row|
					date_split = row[0].split('/')
					clear[row[1].downcase,date_split[2].to_i,date_split[1].to_i,date_split[0].to_i,row[3].to_f]
			end
			csv
		end
		
		def v1?
			@date == @arg_2 && is_empty(@arg_3)
		end
	
		def v1
			@result << [@date,@account,@category,@amount,@currency,@description]
		end
	
		def v2?
			@date == @arg_2 && is_number(@arg_3) && (@amount.to_f >= @arg_3.to_f-10 && @amount.to_f <= @arg_3.to_f+10)
		end
	
		def v2
			@result << [@date,@account,@category,@amount,@currency,@description]
		end
	
		def v3?
			@arg_2 != "xml" && !is_date(@arg_2) && !is_number(@arg_2) && @account == @arg_2 && is_empty(@arg_3)
		end
	
		def v3
			@sum_amount += @amount
			@result << [@date,@account,@category,@amount,@currency,@description]
		end
	
		def v4?
			@arg_2 == "xml" && is_empty(@arg_3)
		end
	
		def v4
			if @xml_created == false
				@xml_doc = REXML::Document.new
				@tags = REXML::Element.new('minify')
				csv_file = sort_by_all(@csv)
				csv_file.each do |row|
					@date = row[0]
					@account = row[1] 
					@category = row[2] 
					@amount = row[3].to_f 
					@currency = row[4] 
					@description = row[5] 
					@tags.add_element('account').add_text(@account).add_element('date').add_text(@date).add_element('amount').add_text(@amount.to_s)
				end	
				@xml_created = true
			end
		
		end
		
		def v6?
			is_number(@arg_2) && is_empty(@arg_3)
		end
		
		def v6
			if @v6 == false
				csv_file = sort_by_date(@csv)
				csv_file.keep_if{ |a|
					is_date(a[0])
				}
				@counter = 1
				csv_file.each do |row|
					@date = row[0]
					@account = row[1] 
					@category = row[2] 
					@amount = row[3].to_f 
					@currency = row[4] 
					@description = row[5] 
					@current_day = @date.split('/').first
					@current_month = @date.split('/')[1]
					@current_year = @date.split('/').last
					@current_month_year = @current_month+'/'+@current_year
					if !@date_array.include?(@current_month_year) && @current_year != @entry_date.split('/').last
						if @entry_date != "" && @counter < 4 
							@array << @hash
							@hash.clear
							@counter = 1
							@entry_date = @date
							@hash.store('entry_date', @entry_date)
							@hash.store('sum', @amount)
						else
							if @counter == 1
								@entry_date = @date
								@hash.store('entry_date', @entry_date)
								@hash.store('sum', @amount)
							end
							@previous_date = @date
						end
						@date_array << @current_month_year
					elsif @date_array.include?(@current_month_year) || (@entry_date.split('/').last == @current_year)
						if @counter == 3
							@counter = 1
							@array << @hash
							puts @array
							@hash.clear
							@entry_date = @date
							@hash.store('entry_date', @entry_date)
							@hash.store('sum', @amount)
							@previous_date = @date
						else
							@hash['sum'] += @amount
							if @current_month != @previous_date.split('/')[1]
								@counter += 1
							end
							@previous_date = @date
						end
					end
				end
			end
			@v6 = true
		end
	
		def read_csv(file)
			if !is_url?(ARGV[0])
				@csv = CSV.read(file)
			else
				@csv = file
			end
			is_v3 = false
			@csv.each do |row|
				@date = row[0]
				@account = row[1] 
				@category = row[2] 
				@amount = row[3].to_f 
				@currency = row[4] 
				@description = row[5] 
				if v1?
					v1
				elsif v2?
					v2
				elsif v3?
					is_v3 = true
					v3
				elsif v4? # same as V5
					v4
				elsif v6?
					v6
				end
			end
			if is_v3 == true
				sort_by_date(@result)
				@result << [@sum_amount.round(2)]
			end
			if @xml_created == true
				output = ''
		    printer = REXML::Formatters::Pretty.new(4)
		    printer.compact = true
		    @xml_doc << @tags
		    printer.write(@xml_doc, output)
		    @result << output
			end
			@result
		end
	
	end
end
