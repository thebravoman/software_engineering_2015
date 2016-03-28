var lineinouravnenie = function(a, b)
{
    var x = -b / a;
    
    if(a !== 0 && b !== 0)
    {
        line(200- (-x*20), 200, 200, 200 - (b * 20));
    }
};

var cent_x = 200;
var cent_y = 200;
var x_start = 50;
var y_start = 50;
fill(0, 0, 0);
line(x_start, cent_y, 350, cent_y);
line(cent_x, y_start, cent_x, 350);

var a = 4, b = 4;
lineinouravnenie(a, b);

// Print y+:
for(var i = 1; i <= 5; i++)
{
    text(i, cent_x + 5, cent_y - 25 * i);
}

// Print x-:
for(var i = 1; i <= 5; i++)
{
    text(-i, cent_x - 25 * i, cent_y + 20);
}

// Print y-:
for(var i = 1; i <= 5; i++)
{
    text(-i, cent_x + 5, cent_y + 25 * i);
}

// Print x+:
for(var i = 1; i <= 5; i++)
{
    text(i, cent_x + 25 * i, cent_y + 20);
}
