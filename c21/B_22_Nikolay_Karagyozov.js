var getValues = function(rows, cols) {
    var values = [];
    for (var i = 0; i < rows; i++) {
        values[i] = [];
        
        for (var j = 0; j < cols; j++) {
            values[i].push(j);
        }
    }
    return values;
};

var values =  getValues(6, 4);

var y = 30;
for (var i = 0; i < values.length; i++) {
    for (var j = 0; j < values[i].length; j++) {
        rect(j * 30, y, 20, 20);
    }
    y += 30;
}
