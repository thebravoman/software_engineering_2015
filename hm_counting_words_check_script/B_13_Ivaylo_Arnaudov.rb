require 'csv'

TESTS_FILENAME = "tests-input.txt"
TESTS_INPUT = "Three three. Four four, four four. Five, five - five, five " +
              "five. Six,six, six, six three six, six."
EXPECTED_OUTPUT = "six,6\nfive,5\nfour,4\nthree,3\n"
RESULTS_FILE = "result.csv"

File.write(TESTS_FILENAME, TESTS_INPUT)
results = []

Dir.glob(ARGV[0] + "*").each do |filename|
  homework_filename = filename.split('/').last
  homework_filename_tokens = homework_filename.split('_')

  class_letter = homework_filename_tokens.first
  number = homework_filename_tokens[1]
  firstname = homework_filename_tokens[2]
  lastname = homework_filename_tokens[3].split('.').first

  shell_output = `ruby #{filename} #{TESTS_FILENAME}`
  solved = 0
  if shell_output == EXPECTED_OUTPUT
    solved = 1
  end

  results.push([class_letter, number, firstname, lastname, solved])
end

sorted_results = results.sort_by { |x| [x[0], x[1].to_i] }

CSV.open(RESULTS_FILE, "w") do |csv|
  sorted_results.each { |entry| csv << entry }
end

File.delete(TESTS_FILENAME)
