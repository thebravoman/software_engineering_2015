module WordCounter
  class FolderParser < Parser

    attr_accessor :total_file_content

    def initialize()
      @total_file_content = ''
    end

    def parse(folder)
      get_content(folder)
      super(total_file_content)
    end

    private
    def get_content(path)
      if (File.file?(path))
        @total_file_content << (File.read(path))
        return
      end

      path << "/" if !path.end_with?("/")

      Dir.glob(path + '*').each do |entity|
        get_content(entity)
      end
    end
  end
end
