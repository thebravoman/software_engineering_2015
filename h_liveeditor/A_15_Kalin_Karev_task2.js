/*
var lineinouravnenie = function(a, b)
{
    var x = 4;
    var y = a * x + b;
    
    if(a !== 0 && b !== 0)
    {
        line(200- (-x*20), 200, 200, 200 - (b * 20));
    }
};
*/

var cent_x = 200;
var cent_y = 200;
var x_start = 50;
var y_start = 50;
fill(0, 0, 0);
line(x_start, cent_y, 350, cent_y);
line(cent_x, y_start, cent_x, 350);

//var a = 4, b = 4;
//lineinouravnenie(a, b);

// Print y+:
for(var i = 1; i <= 6; i++)
{
    text(i, cent_x + 5, cent_y - 25 * i);
}

// Print x-:
for(var i = 1; i <= 6; i++)
{
    text(-i, cent_x - 25 * i, cent_y + 20);
}

// Print y-:
for(var i = 1; i <= 6; i++)
{
    text(-i, cent_x + 5, cent_y + 25 * i);
}

// Print x+:
for(var i = 1; i <= 6; i++)
{
    text(i, cent_x + 25 * i, cent_y + 20);
}

var a = 2;
var b = 2;
var c = -6;
var x1;
var x2;
var y1;
var y2;

var vruh = function(a, b) 
{
    return (-b/(2 * a));
};

var fory = function(a, b, c, x)
{
    return (a * x * x + b * x + c);
};

var linedraw = function(x1, y1, x2, y2)
{
    line(25 * x1 + cent_x, cent_y - 25 * y1, 25 * x2 + cent_x, cent_y - 25 * y2);
};

var Xvruh = vruh(a,b);


x1 = Xvruh;
y1 = fory(a,b,c,x1);
x2 = x1 - 1;
y2 = fory(a,b,c,x2);
linedraw(x1, y1, x2, y2);

x1 = x2;
y1 = y2;
x2 = x1 - 1;
y2 = fory(a,b,c,x2);
linedraw(x1, y1, x2, y2);

x1 = x2;
y1 = y2;
x2 = x1 + 1;
y2 = fory(a,b,c,x2);
linedraw(x1, y1, x2, y2);

x1 = Xvruh;
y1 = fory(a,b,c,x1);
x2 = x1 + 1;
y2 = fory(a,b,c,x2);
linedraw(x1, y1, x2, y2);

x1 = x2;
y1 = y2;
x2 = x1 + 1;
y2 = fory(a,b,c,x2);
linedraw(x1, y1, x2, y2);

x1 = x2;
y1 = y2;
x2 = x1 + 1;
y2 = fory(a,b,c,x2);
linedraw(x1, y1, x2, y2);
