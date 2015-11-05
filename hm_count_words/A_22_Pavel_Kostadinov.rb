require 'json'
require 'rexml/document'


file_path = ARGV[0]
xml_json = ARGV[1]
f = File.open(file_path, "r")
h = Hash.new(0)

marks_sum = 0

f.each_line do |line|
	marks_sum += line.count(".,!?:;-%@#$^„&[<(>`~'])“*/ ")
	w = line.downcase.gsub(/[,()'"„“.*?:;]/, ' ').split(" ")
	
	w.each do |words|
		#words = words.gsub(/[^a-z'\n- ]/, '')
		h[words] += 1
	end	
end


h = h.sort_by{|words,number| words.downcase}
h = h.sort_by{|words,number| [-number,words]}

if xml_json == 'json'
  hash_json = {
		"marks" => marks_sum.length,
		"words" => h
	}
	puts  hash_json.to_json


elsif xml_json == 'xml'
  xml_ = REXML::Document.new('') 
  word_c_t = xml_.add_element('word-counts')
  word_c_t.add_element('marks').add_text marks_sum.to_s
  words_t = word_c_t.add_element('words')

      h.each do |word, count|
        words_t.add_element('word', {'count' => count}).add_text word
      end
  formatter = REXML::Formatters::Pretty.new(4)
  formatter.compact = true
  formatter.write(xml_, $stdout)

else
h.each do |words, number|
	puts "#{words},#{number}"
end

 if marks_sum != 0
	puts "\"marks\",#{marks_sum}"
 end
end
