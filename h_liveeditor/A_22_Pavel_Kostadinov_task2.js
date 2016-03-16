var discriminant = function(a,c,b)
{
        var d = b*b - 4*a*c;
        return d;
};

var y_find = function(a,b,c,x)
{
            var y = a*x*x + b*x + c;
            return y;
            
};

var top_find = function(b,a)
{
    var x_top = - b / (2*a);
    return x_top;
};


var a = 3;
var b = 50;
var c = 90;
var y1;
var y2;
var x1;
var x2;
var x_top = top_find(b,a);

x1 = x_top;
y1 = y_find(a,b,c,x1);
x2 = x1 - 2;
y2 = y_find(a,b,c,x2);
beginShape();
    curveVertex(x2, y2);
    curveVertex(0, y1);

x1 = x2;
y1 = y2;
x2 = x1 - 3;
y2 = y_find(a,b,c,x2);


curveVertex(x1, y1);

x1 = x2;
y1 = y2;
x2 = x1 + 4;
y2 = y_find(a,b,c,x2);

curveVertex(x1, y1);
curveVertex(80, 150);

x1 = x_top;
y1 = y_find(a,b,c,x1);
x2 = x1 + 5;
y2 = y_find(a,b,c,x2);

curveVertex(150, y1);
curveVertex(x2, y2);

x1 = x2;
y1 = y2;
x2 = x1 + 7;
y2 = y_find(a,b,c,x2);



x1 = x2;
y1 = y2;
x2 = x1 + 10;
y2 = y_find(a,b,c,x2);





endShape();

