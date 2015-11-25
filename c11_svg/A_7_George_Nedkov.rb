File.open ("result.svg","w") do |f|
 f.write('
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="400">
   <circle cx="80" cy="90" r="25" stroke="black" stroke-width="3" fill="blue" />
   <circle cx="124" cy="60" r="25" stroke="green" stroke-width="3" fill="green" />
   <circle cx="85" cy="130" r="25" stroke="black" stroke-width="3" fill="red" />
   
    <circle cx="170" cy="80" r="25" stroke="black" stroke-width="3" fill="yellow" />
     <circle cx="180" cy="120" r="25" stroke="black" stroke-width="3" fill="green" />
     <circle cx="134" cy="150" r="25" stroke="black" stroke-width="3" fill="red" />
     <circle cx="130" cy="100" r="30" stroke="black" stroke-width="3" fill="black" />
</svg>')
