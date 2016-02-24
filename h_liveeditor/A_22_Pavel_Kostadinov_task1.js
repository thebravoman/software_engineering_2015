line(50,200,350,200);
line(200,50,200,350);

var equation = function(a,b,y)
{

    var x = (y - b) /a;
    return x;
};
var a = 1;
var b = 10;
var y = 16;

var y2 = 130;

var x = equation(a,b,y);
var x2 = equation(a,b,y2);
line(x,y,x2,y2);


