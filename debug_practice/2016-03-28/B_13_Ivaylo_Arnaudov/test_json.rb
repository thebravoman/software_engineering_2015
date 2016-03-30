require 'csv'

TESTS_FILENAME = "tests-input.txt"
TESTS_INPUT = "class MyClass def method(p,q) i = 0 end end"
FILENAME = 'B_13_Ivaylo_Arnaudov_RRdWxRiRIZ.rb'

EXPECTED_OUTPUT = '{ "marks": 4, "words": [ [ "end", 2 ], [ "0", 1 ], [ "class", 1 ], [ "def", 1 ], [ "i", 1 ], [ "method", 1 ], [ "myclass", 1 ], [ "p", 1 ], [ "q", 1 ] ] } '

File.write(TESTS_FILENAME, TESTS_INPUT)

shell_output = `ruby -I B_13_Ivaylo_Arnaudov_RRdWxRiRIZ/ #{FILENAME} #{TESTS_FILENAME} json`
solved = 0

if shell_output.gsub(/\s+/, "") == EXPECTED_OUTPUT.gsub(/\s+/, "")
  solved = 1
end

puts solved
