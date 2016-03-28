var x = 16;
var arr =  new Array(x);
for(var i = 0 ; i < x ; i++){
 arr[i] = i;   
}

var printArray = function (array) {
 var cord = 10;
for(var i = 0 ; i < x ; i++){
    rect(cord,10,10,15);
    text(arr[i],cord+1,9,9,14);
    cord += 10;
}
};

printArray(arr);
