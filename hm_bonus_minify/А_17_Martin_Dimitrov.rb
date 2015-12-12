require 'csv'
class ReadCSV
	private
	DATA_FIELD = 0
	ACC_FIELD = 1
	AMOUNT_FIELD = 3
	def self.ConvertData data
		data_split = data.split('/');
		dd = data_split[0]
		mm = data_split[1]
		yyyy = data_split[2]
		"#{yyyy}/#{mm}/#{dd}"
	end
	public
	def self.print_data_input filename, requested_data, value
		min_value = value.to_f - 10
		max_value = value.to_f + 10
		CSV.foreach(filename) do |row|
			amount = row[3].to_f
			if row[0] == requested_data && (value == nil || ( amount > min_value && amount < max_value ))
				puts "#{row.join(',')}"
			end
		end
	end
	def self.print_acc_input filename, requested_acc
		output = []
		sum = 0;
		CSV.foreach(filename) do |row|
			acc = row[ACC_FIELD]
			if acc == requested_acc
				output << row
				sum += row[AMOUNT_FIELD].to_f
			end
		end
		output.sort_by! { |row| ConvertData(row[DATA_FIELD]) }
		output.each do |row|
			puts "#{row.join(',')}"
		end
		puts "#{sum.round 2}"
	end
end
def data? str
  /\d{1,2}\/\d{1,2}\/\d*/.match str
end
def number? str
  true if Float(str) rescue false
end
filename = ARGV[0]
arg1 = ARGV[1]
arg2 = ARGV[2]
if data? arg1
	ReadCSV.print_data_input filename, arg1, arg2
elsif number? arg1
elsif arg1 == 'xml'
else
	ReadCSV.print_acc_input filename, arg1
end
