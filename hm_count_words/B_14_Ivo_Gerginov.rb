require './B_14_Ivo_Gerginov/word_counter'

f_path = ARGV[0]
op = ARGV[1]

w_counter = WordCounter.new()
res = w_counter.parse_file(f_path)

if op == 'json'
 res.to_json
elsif op == 'xml'
 res.to_xml
else res.to_csv
end

