`ruby B_09_Georgi_Stoilov_RRdWxRiRIZ.rb test.txt svg`
result = ""
File.open("B_13_Ivaylo_Arnaudov.svg", "r") do |file|
  file.each_line do |line|
    result += line
  end
end
expected = "<?xml version='1.0'?>
<svg width='60' height='350' xmlns='http://www.w3.org/2000/svg'>
<rect height='200' width='15' x='0' y='0' fill='#00FFFF'/>
<text transform='rotate(90 3.0,210)' x='3.0' y='210' fill='#00FFFF' font-size='13' font-family='Tahoma'>am</text>
<rect height='200.0' width='15' x='15' y='0.0' fill='#00FFFF'/>
<text transform='rotate(90 18.0,210)' x='18.0' y='210' fill='#00FFFF' font-size='13' font-family='Tahoma'>i</text>
<rect height='100.0' width='15' x='30' y='100.0' fill='#00FFFF'/>
<text transform='rotate(90 33.0,210)' x='33.0' y='210' fill='#00FFFF' font-size='13' font-family='Tahoma'>george</text>
<rect height='100.0' width='15' x='45' y='100.0' fill='#00FFFF'/>
<text transform='rotate(90 48.0,210)' x='48.0' y='210' fill='#00FFFF' font-size='13' font-family='Tahoma'>seventeen</text>
</svg>
"

if result == expected
  puts 1
else
  puts 0
end
