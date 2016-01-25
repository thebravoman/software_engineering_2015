require_relative 'file_parser'

module WordCounter

  class FolderParse

    def join_repetitive filename
      csv = CSV.read(filename)
      hash = Hash.new()

      i = 0
      csv.group_by{|row| row[0]}.values.each do |group|
          hash[i] = group.map{|r| r[1]} * ' '
          i += 1
      end

      arr = []
      count = 0
      hash.each do |key, value|
        asd = value.split(' ')
        sum = 0
        asd.each do |a|
          sum += a.to_i
        end
        arr[count] = sum
        count += 1
      end

      count = 0
      hash.each do |k, v|
        hash[k] = arr[count]
        count += 1
      end
      CSV.open('result_Georgi_Stoilov.csv', 'w', { col_sep: "\t", force_quotes: false }) do |file|
        i = 0
        csv.group_by{|row| row[0]}.values.each do |group|
          file << [[group.first[0], hash[i]] * ',']
          i += 1
        end
      end
    end

    def sort_csv csv_to_sort
    	my_csv = CSV.read csv_to_sort
      my_csv.sort! do |a,b|
        if a[1].to_i == b[1].to_i
          [a[0]] <=> [b[0]]
        else
          [b[1].to_i] <=> [a[1].to_i]
        end
      end

      i = 0
    	CSV.open('result_Georgi_Stoilov.csv', 'w', {quote_char:" "}) do |csv|
        my_csv.each { |element| csv << element }
      end
    end

    def parsing_folder folder, format
      directory = folder.gsub("\n",'')
      directory.insert(directory.size, '/**/*.*')
      Dir.glob(directory).each do |f|
        result = FileParser.new.parse_file f
        if format == 'csv' || format == nil
          result.to_csv
          join_repetitive('result_Georgi_Stoilov.csv')
          sort_csv('result_Georgi_Stoilov.csv')
          else
          if format == 'json'
            a = result.to_json
            file_name="observations.csv"
            else
            if format == 'xml'
              result.to_xml
            end
          end
        end
      end
    end

  end

end
