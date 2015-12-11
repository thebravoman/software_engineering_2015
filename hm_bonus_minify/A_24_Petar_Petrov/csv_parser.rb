require 'csv'

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
	
	def read_csv(file)
		@csv = CSV.read(file)
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
			end
		end
		if is_v3 == true
			@result.sort_by! do |row|
				date_split = row[0].split('/')
				[date_split[2].to_i,date_split[1].to_i,date_split[0].to_i]
			end
			@result << [@sum_amount.round(2)]
		end
		@result
	end
	
end
