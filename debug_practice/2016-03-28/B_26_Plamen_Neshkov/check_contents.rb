def check_contents(correct_contents)
  actual_contents = File.open('result', 'r').read.gsub(/\s+/, "")
  correct_contents = correct_contents.gsub(/\s+/, "")

  correct_contents == actual_contents
end
