var arr_size = 4;
var arr = new Array(arr_size);
var counter = 1;

for(var i = 0; i < arr_size; i += 1) {
    arr[i] = new Array(arr_size);
    for(var j = 0; j < arr_size; j += 1) {
        arr[i][j] = counter;
        
        counter += 1;
    }
}

var count = 0;

for(var i = 0; i < arr_size; i += 1) {
    for(var j = 0; j < arr_size; j += 1) {
        rect(45*i, 45*j, 40, 40);
        fill(0, 0, 0);
        text(count, 45*i + 10, 45*j + 10, 40, 40);
        fill(255, 255, 255);
        count += 1;
    }
}