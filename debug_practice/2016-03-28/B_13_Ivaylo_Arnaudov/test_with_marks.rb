FILENAME = 'B_13_Ivaylo_Arnaudov_RRdWxRiRIZ.rb'
EXPECTED_OUTPUT = '{ "marks": 4, "words": [ [ "end", 2 ], [ "0", 1 ], [ "class", 1 ], [ "def", 1 ], [ "i", 1 ], [ "method", 1 ], [ "myclass", 1 ], [ "p", 1 ], [ "q", 1 ] ] } '

shell_output = `ruby -I B_13_Ivaylo_Arnaudov_RRdWxRiRIZ/ #{FILENAME} https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/hm_count_words/ruby_program_for_counting.rb json`

solved = 0
if shell_output.gsub(/\s+/, "") == EXPECTED_OUTPUT.gsub(/\s+/, "")
  solved = 1
end

puts solved
