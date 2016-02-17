var printArray = function (array) {
    var y = 30;
    for (var i = 0; i < array.length; i++) {
        for (var j = 0; j < array[i].length; j++) {
            rect(j * 30, y, 20, 20);
        }
        y += 30;
    }
};

var arr = [
        [1, 2, 3],
        [1, 2, 3]
];

printArray(arr);
