require 'rexml/document'
path = ARGV.first

dumi = Hash.new(0)
file = File.open(path, "r")
niceHash = Hash.new(0)
symbols = 0

file.each_line do |line|

  symbols = symbols + line.count("./'!@#$^&,%*\\(){}[?]\":;+=`~><_-")
  word = line.downcase.gsub(/[^\w'\s-]/, '').split(" ")
    
  word.each do |counter|
    dumi[counter] = dumi[counter] + 1
  end
  
end


dumi = dumi.sort{|x, y| x <=> y}.sort{|x, y| y[1] <=> x[1]}

if ARGV[1] == 'json'
    require 'json'
    niceHash = {
        "marks" => symbols,
        "words" => dumi
    }
    puts JSON.pretty_generate(niceHash)

    
elsif ARGV[1] == 'xml'
    
    dog = REXML::Document.new('')
    wordCount = dog.add_element('word-count')
    wordCount.add_element('marks').add_text symbols.to_s
    words = wordCount.add_element('words')
    dumi.each do |currentWord, counter|
        words.add_element('word',{'count' => counter}).add_text currentWord
    end
    
    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(dog, $stdout)
else
    dumi.each do |word, counter|    
        puts "#{word},#{counter}"
    end

    puts "\"marks\",#{symbols}" if symbols != 0
end
