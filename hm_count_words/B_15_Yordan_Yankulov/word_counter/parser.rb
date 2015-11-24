module WordCounter
  class Parser
    def parse(string)
        help = Hash.new
        punctuation = string.scan(/[[:punct:]]/).count
        the_words = string.downcase.split
        the_words.each { |words|
          words = words.gsub(/[\W+_\d+]/, ' ')
          if (words.include?(" "))
            words = words.split(" ")
            words.each do |smth|
              if help.has_key?(smth)
                help[smth] = help[smth] + 1
              else
                help[smth] = 1
              end
            end
          else
            if help.has_key?(words)
              help[words] = help[words] + 1
            else
              help[words] = 1
            end
          end
        }
        my_help = help.sort {|first,second| (second[1] == first[1]) ? (first[0] <=> second[0]) : (second[1]<=>first[1])}
        Result.new(punctuation, my_help)
    end
  end
end
