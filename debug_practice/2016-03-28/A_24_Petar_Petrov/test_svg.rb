`ruby -I A_24_Petar_Petrov_RRdWxRiRIZ/ A_24_Petar_Petrov_RRdWxRiRIZ.rb ../../../hm_count_words/text.txt svg`
`rm B_13_Ivaylo_Arnaudov.db`
result = File.read 'B_13_Ivaylo_Arnaudov.svg'
expected = <<-TEXT
<?xml version='1.0'?>
<svg width='30' height='350' xmlns='http://www.w3.org/2000/svg'>
<rect height='200' width='15' x='0' y='0' fill='#0066ff'/>
<text transform='rotate(90 3.0,210)' x='3.0' y='210' fill='#0066ff' font-size='13' font-family='Tahoma'>sentence</text>
<rect height='200.0' width='15' x='15' y='0.0' fill='#0066ff'/>
<text transform='rotate(90 18.0,210)' x='18.0' y='210' fill='#0066ff' font-size='13' font-family='Tahoma'>some</text>
</svg>
TEXT
if result == expected
  1
else 
  0
end
