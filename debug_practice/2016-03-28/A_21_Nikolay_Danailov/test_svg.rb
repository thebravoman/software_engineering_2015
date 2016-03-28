`ruby -I A_21_Nikolay_Danailov_RRdWxRiRIZ A_21_Nikolay_Danailov_RRdWxRiRIZ.rb test.txt svg`
result = File.read 'B_13_Ivaylo_Arnaudov.svg'

expected = <<-TEXT
<?xml version='1.0'?>
<svg width='75' height='350' xmlns='http://www.w3.org/2000/svg'>
<rect height='200' width='15' x='0' y='0' fill='#629e24'/>
<text transform='rotate(90 3.0,210)' x='3.0' y='210' fill='#629e24' font-size='13' font-family='Tahoma'>hello</text>
<rect height='100.0' width='15' x='15' y='100.0' fill='#4e4a7a'/>
<text transform='rotate(90 18.0,210)' x='18.0' y='210' fill='#4e4a7a' font-size='13' font-family='Tahoma'>friend</text>
<rect height='100.0' width='15' x='30' y='100.0' fill='#88a73c'/>
<text transform='rotate(90 33.0,210)' x='33.0' y='210' fill='#88a73c' font-size='13' font-family='Tahoma'>my</text>
<rect height='100.0' width='15' x='45' y='100.0' fill='#4b5d9f'/>
<text transform='rotate(90 48.0,210)' x='48.0' y='210' fill='#4b5d9f' font-size='13' font-family='Tahoma'>there</text>
<rect height='100.0' width='15' x='60' y='100.0' fill='#8f8094'/>
<text transform='rotate(90 63.0,210)' x='63.0' y='210' fill='#8f8094' font-size='13' font-family='Tahoma'>world</text>
</svg>
TEXT

if expected == result
  1
else
  0
end