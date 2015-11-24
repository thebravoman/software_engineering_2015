File.open("result.svg", "w") do |f|
    f.write('<svg xmlns="http://www.w3.org/2000/svg" height="300" width="300">
  <circle cx="80" cy="30" r="20" stroke="black" stroke-width="3" fill="red" />
  <circle cx="130" cy="30" r="20" stroke="black" stroke-width="3" fill="green" />
  <circle cx="30" cy="80" r="20" stroke="black" stroke-width="3" fill="yellow" />
 
<circle cx="130" cy="80" r="20" stroke="black" stroke-width="3" fill="blue" />
<circle cx="30" cy="130" r="20" stroke="black" stroke-width="3" fill="blue" />
<circle cx="80" cy="130" r="20" stroke="black" stroke-width="3" fill="red" />
<circle cx="130" cy="130" r="20" stroke="black" stroke-width="3" fill="green" />
<text x="70" y="220" fill="green">Antonio Mindov</text>
<rect x = "60" y = "60" width="40" height="40" style="fill:pink;stroke-width:1;stroke:rgb(0,0,0)"></rect>
</svg>')
   
end
