module WordCounter
  class Parser
    def parse (content)
      str_res = Result.new

      #puts content.scan("\n").count
      str_res.marks = content.scan(/[\p{S}\p{P}]/u).count
      content = content.gsub(/[\W+ ._\s]/, ' ').downcase
      list = content.split(' ')

      list.each do |index|
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
