def traffic_light
    return '
    <svg width="400" height="900">
        <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="green" />
        <circle cx="50" cy="150" r="40" stroke="black" stroke-width="3" fill="yellow" />
        <circle cx="50" cy="250" r="40" stroke="black" stroke-width="3" fill="red" />
        <text x="0" y="500" fill="red">Radostin</text>
    </svg>
    '
end
File.open("result.svg", "w") do |f|
    f << traffic_light
end
