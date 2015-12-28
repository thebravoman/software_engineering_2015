require_relative 'file_parser'

module WordCounter

  class FolderParse

    def parsing_folder folder, format
      directory = folder.gsub("\n",'')
      directory.insert(directory.size, '/**/*.*')
      Dir.glob(directory).each do |f|
        result = FileParser.new.parse_file f
        if format == 'csv' || format == nil
          result.to_csv
          else
          if format == 'json'
            result.to_json
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
