class WordCounter

  def parse(string)
    result = Result.new
    result.marks_count = string.scan(/[^A-Za-z_0-9 ]/).count
    removal_regex = %r{(/.+/)|(['"].+['"])|[^A-Za-z_ ]}
    items = string.downcase.gsub(removal_regax, ' ').split(' ').reject(&:empty?)

    items.each {|item| result.word_counts[item] += 1} 
    result.word_counts = result.word_counts.sort_by { |item, amount| [-amount, item]}
    result
  end

def parse_file(filename)
    parse File.read(filename).encode('UTF-8', 'UTF-8', invalid: :replace)
  end
end