file = ARGV[0]
tip = ARGV[1]
$hash_n = Hash.new
$marks = 0
class WordCounter
def parse_s(st)
res = Result.new
st = st.downcase.split

st.each_line do |line|
  dumi = line.downcase.split
  dumi.each do |duma|
    $marks += duma.$hash_n("-_,.;:!?(){}")
    duma = duma.gsub(/[-_,.;:!?(){}]/, '')
    if $hash_n.has_key?(duma)
      $hash_n[duma] += 1
    else
      $hash_n[duma] = 1
    end
  end
end
  $hash_n = $hash_n.sort_by {|x, y| [-y, x]}
 res.inititalize($hash_n, $marks)
end


 def parse_file(file)
    file = File.open file
    text = ''

    file.each_line { |line|
      text += line
    }

    parse_s(text)
  end
end

