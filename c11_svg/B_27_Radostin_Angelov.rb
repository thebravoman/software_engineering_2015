def traffic_light
    return '
    <svg xmlns="http://www.w3.org/2000/svg"  width="400" height="900">
        <rect x="0" y="0" width="110" height="360"
        style="fill:black;stroke:black;stroke-width:5;opacity:0.5" />
        <circle cx="50" cy="250" r="40" stroke="black" stroke-width="3" fill="red" />
        <circle cx="50" cy="150" r="40" stroke="black" stroke-width="3" fill="yellow" />
        <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="green" />
        <text x="0" y="500" fill="red">Radostin Angelov</text>
    </svg>
    '
end
File.open("result.svg", "w") do |f|
    f << traffic_light
end
