var array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];


var count = 0;
var i = 0;
for (count; i<array.length; count++){
    for(i; i < array[count].length; i++){
        rect(count*40, i*40, 40, 40);
    }
}
