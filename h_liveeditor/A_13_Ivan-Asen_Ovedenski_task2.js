var a = 1;
var b = 5;
var c = 6;
var previous_x = 0;
var previous_y = 0;

var quadratic_graph = function(a,b,c){
    var y;
    for (var i = 0; i < 10;i++){
        y = a * i * i + b * i + c;
        line(previous_x, previous_y, i, y);
        previous_x = i;
        previous_y = y;
    }
    
};
quadratic_graph(a,b,c);
