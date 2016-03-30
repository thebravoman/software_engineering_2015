`ruby -I B_22_Nikolay_Karagyozov_RRdWxRiRIZ/ B_22_Nikolay_Karagyozov_RRdWxRiRIZ.rb test.txt svg`
result = File.read 'B_13_Ivaylo_Arnaudov.svg'

puts result

expected =
"<?xml version='1.0'?>
<svg width='45' height='350' xmlns='http://www.w3.org/2000/svg'>
<rect height='200' width='15' x='0' y='0' fill='#6a2e48'/>
<text transform='rotate(90 3.0,210)' x='3.0' y='210' fill='#6a2e48' font-size='13' font-family='Tahoma'>wat</text>
<rect height='66.66666666666666' width='15' x='15' y='133.33333333333334' fill='#bd34b9'/>
<text transform='rotate(90 18.0,210)' x='18.0' y='210' fill='#bd34b9' font-size='13' font-family='Tahoma'>asd</text>
<rect height='66.66666666666666' width='15' x='30' y='133.33333333333334' fill='#3f4769'/>
<text transform='rotate(90 33.0,210)' x='33.0' y='210' fill='#3f4769' font-size='13' font-family='Tahoma'>dsa</text>
</svg>
"

if expected.eql? result
  puts 1
else
  puts 0
end
