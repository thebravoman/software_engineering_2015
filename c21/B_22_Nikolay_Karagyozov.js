var values = [
        [1, 2, 3],
        [1, 2, 3],
        [1, 2, 3]
];

var y = 30;
for (var i = 0; i < values.length; i++) {
    for (var j = 0; j < values[i].length; j++) {
        rect(j * 30, y, 20, 20);
    }
    y += 30;
}
