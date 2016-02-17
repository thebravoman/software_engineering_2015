var arr_size = 4;
var arr = new Array(arr_size);
var counter = 1;

text("something", 100, 100, 100, 100);

for(var i = 0; i < arr_size; i += 1) {
    arr[i] = new Array(arr_size);
    for(var j = 0; j < arr_size; j += 1) {
        arr[i][j] = counter;
        
        counter += 1;
    }
}

for(var i = 0; i < arr_size; i += 1) {
    for(var j = 0; j < arr_size; j += 1) {
        rect(45*i, 45*j, 40, 40);
    }
}