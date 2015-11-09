require 'csv'
def student_checked? checked_files, first_name, surname
    checked_files.include? [first_name,surname]
end
def name_getter filename
    filename.split("/").last.split("_")
end
def remove_file_ext value
    value.split(".").first
end
checked_files = []
CSV.open("result.csv", "w") do |csv_array|
    previous_number = 0
    Dir.glob(ARGV[0]+"*").each do |filename|
        name = name_getter filename
        number = remove_file_ext name[2]
        surname = name[1]
        first_name = name[0]
        if !student_checked? checked_files,first_name,surname
            if surname.size == 5
                csv_array << [first_name,surname]
                checked_files << [first_name, surname]
            end
        end

    end
end
my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| b[0] <=> a[0] }
CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
end



	

