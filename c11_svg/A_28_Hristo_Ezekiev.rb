File.open("result.svg", "w") do |f|

  f.write('
<svg xmlns="http://www.w3.org/2000/svg" height="300" width="300">
  <circle cx="80" cy="60" r="30" stroke="black" stroke-width="3" fill="red" />
  <circle cx="145" cy="57" r="30" stroke="black" stroke-width="3" fill="orange" />
  <circle cx="60" cy="130" r="30" stroke="black" stroke-width="3" fill="purple" />
  <circle cx="118" cy="170" r="30" stroke="black" stroke-width="3" fill="green" />
  <circle cx="173" cy="120" r="30" stroke="black" stroke-width="3" fill="yellow" />
  <rect x="90" y="90" width="50" height="50" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
  <text x="70" y="220" fill="green">Hristo Ezekiev</text>
  Sorry, your browser does not support inline SVG.  
</svg>')
end
