def circle x,y,r
'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="white" stroke-width="2" fill="red" />'
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg" height="500" width="500">
  <circle cx="150" cy="50" r="20" stroke="black" stroke-width="3" fill="red" />
  <circle cx="200" cy="90" r="20" stroke="black" stroke-width="3" fill="green" />
  <circle cx="110" cy="90" r="20" stroke="black" stroke-width="3" fill="yellow" />
  <circle cx="130" cy="140" r="20" stroke="black" stroke-width="3" fill="brown" />
  <circle cx="180" cy="140" r="20" stroke="black" stroke-width="3" fill="pink" /> 
  <circle cx="155" cy="95" r="20" stroke="red" stroke-width="10" fill="white" />
  <text x="70" y="15" fill="red">Georgi Tsitselkov</text>
  
</svg> ')
end
