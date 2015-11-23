module WordCounter
  class Parser
    def parse (file_path)
      str_res = Result.new 
      marks = 0

      file = File.open(ARGV[0], "r")
      contents = file.read
      str_res.marks = contents.scan(/[\p{S}\p{Punct}]/u).count
      contents = contents.gsub(/[\W+.\d+_]/, ' ')
      contents = contents.downcase.split(" ")
      
      contents.each do |index|
        if str_res.str[index]
          str_res.str[index] += 1
        else
          str_res.str[index] = 1
        end
      end

      str_res.str = str_res.str.sort_by{|index,key| index}
      str_res.str = str_res.str.sort_by {|index,key| [-key,index]}
          
      str_res
  
    end
  end
end
