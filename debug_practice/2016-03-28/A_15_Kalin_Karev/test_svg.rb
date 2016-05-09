'ruby -I A_15_Kalin_Karev_RRdWxRiRIZ A_15_Kalin_Karev_RRdWxRiRIZ.rb test.txt svg'

result = File.read 'B_13_Ivaylo_Arnaudov.svg'
wanted = <<-TEXT
<?xml version='1.0'?>
<svg width='60' height='350' xmlns='http://www.w3.org/2000/svg'>
<rect height='200' width='15' x='0' y='0' fill='#d2839c'/>
<text transform='rotate(90 3.0,210)' x='3.0' y='210' fill='#d2839c' font-size='13' font-family='Tahoma'>are</text>
<rect height='200.0' width='15' x='15' y='0.0' fill='#1615a0'/>
<text transform='rotate(90 18.0,210)' x='18.0' y='210' fill='#1615a0' font-size='13' font-family='Tahoma'>hello</text>
<rect height='200.0' width='15' x='30' y='0.0' fill='#5228d2'/>
<text transform='rotate(90 33.0,210)' x='33.0' y='210' fill='#5228d2' font-size='13' font-family='Tahoma'>how</text>
<rect height='200.0' width='15' x='45' y='0.0' fill='#565279'/>
<text transform='rotate(90 48.0,210)' x='48.0' y='210' fill='#565279' font-size='13' font-family='Tahoma'>you</text>
</svg>
TEXT

if result == wanted
	puts "1"
else 
	puts "0"
end
