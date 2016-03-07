var myFunction = function(var a[][]) {
    
}
rect(10, 10, 100, 100);
rect(200, 200, 50, 100);
fill(0,0,0);
text("hello",200,200,50,100);
rect(100, 200, 80, 100);
fill(255, 255, 255);
rect(50,200,30,50);
fill(201, 52, 201);
rect(50,250,10,55);
var n = 10;
for(var i = 0; i < n; i++){
    rect(120  , i * 10 + i * 5 , 10, 10);
}

fill(31, 148, 59);
for(var i = 0; i < n; i++){
    for(var j = 0; j < n; j++){
        rect(140 + (15 * j) , 15 * i, 10, 10);
    }
}
