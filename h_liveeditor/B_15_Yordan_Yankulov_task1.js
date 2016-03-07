var fx = function(a,b)
{
    var x = -b/a;
    return x;
};
var a = -0.42;
var b = 50;
var x = fx(a,b);
var y = b;
line(x, 0, 0, y);
