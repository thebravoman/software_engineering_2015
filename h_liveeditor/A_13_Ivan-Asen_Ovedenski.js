var a = 5;
var b = 6;

var graph = function(a,b) {
    var x1 = 4;
    var y1 = a*x1 -b;
    var x2 = 5;
    var y2 = a*x2 -b;
    line(x1,y1,x2+100,y2+100);
};
graph(a,b);
