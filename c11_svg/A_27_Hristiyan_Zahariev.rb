File.open("result.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300">
   <circle cx="80" cy="80" r="30" stroke="green" stroke-width="3" fill="pink" /> 
   <circle cx="140" cy="80" r="30" stroke="green" stroke-width="3" fill="brrow" />
   <circle cx="60" cy="130" r="30" stroke="green" stroke-width="3" fill="green" />
 <circle cx="160" cy="135" r="30" stroke="green" stroke-width="4" fill="red" />
    <circle cx="110" cy="165" r="30" stroke="green" stroke-width="4" fill="yellow" />
  <rect x="90" y="90" width="50" height="50" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
  <text x="55" y="220" fill ="blue">Hristiyan Zahariev </text>
</svg>')
  
end
