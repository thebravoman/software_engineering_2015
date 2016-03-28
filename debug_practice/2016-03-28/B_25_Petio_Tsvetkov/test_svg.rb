`ruby -I B_25_Petio_Tsvetkov_RRdWxRiRIZ B_25_Petio_Tsvetkov_RRdWxRiRIZ.rb test.txt svg`
result = File.read 'B_13_Ivaylo_Arnaudov.svg'

expected =
"<?xml version='1.0'?>
<svg width='30' height='350' xmlns='http://www.w3.org/2000/svg'>
<rect height='200' width='15' x='0' y='0' fill='#a1e731'/>
<text transform='rotate(90 3.0,210)' x='3.0' y='210' fill='#a1e731' font-size='13' font-family='Tahoma'>sentence</text>
<rect height='200.0' width='15' x='15' y='0.0' fill='#a1e731'/>
<text transform='rotate(90 18.0,210)' x='18.0' y='210' fill='#a1e731' font-size='13' font-family='Tahoma'>some</text>
</svg>
"

if expected == result
  1
else
  0
end
