var a = 5;
var b = 6;

var Linear  = function (a,b)
{
    var y = random(0,100);
    var x = (y-b)/a;
    var y1 = random(0,100);
    var x1 = (y1-b)/a;
    line(x,y,x1*3,y1*3);
};
Linear(a,b);
