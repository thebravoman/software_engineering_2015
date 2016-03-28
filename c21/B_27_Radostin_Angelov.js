var printArray = function (array) {
    //var context = document.getElementsByClassName("scratchpad-canvas-wrap")[0];
    
    var y = 30;
    for (var i = 0; i < array.length; i++) {
        for (var j = 0; j < array[i].length; j++) {
            fill(123, 23, 43);
            rect(j * 60, y, 50, 50);
            fill(123, 123, 123);
            text(array[i][j], j*60, y, 20, 20);
        }
        y += 60;
    }
};

var arr = [
        [1, 2, 3],
        [1, 2, 3]
];

printArray(arr);
