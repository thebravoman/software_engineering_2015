var equation = function(a,b,c)
{

    var x = c - b/a;
    return x;
};
var a = 5;
var b = 8;
var y = 10;

var x = equation(a,b,y);
fill(255, 0, 0);
line(x,y,100,100);
