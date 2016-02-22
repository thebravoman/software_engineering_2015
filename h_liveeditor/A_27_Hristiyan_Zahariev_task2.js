var a = -1;
var b = 2;
var c = 5;
var x1;
var x2;
var y1;
var y2;
line(0,200,400,200);
line(200,0,200,400);

var find_y = function(a, b, c, x)
{
    return (a * x * x + b * x + c);
};

var x_top = function(a, b) 
{
    return (-b/(2 * a));
};

var draw_graph = function(x1, y1, x2, y2)
{
    line((20 * x1) + 200, 200 - (20 * y1), (20 * x2) + 200, 200 - (20 * y2));
};

var x_top = x_top(a,b);

if (x_top < 0) {
    for(var i = 0; i < 20; i++) {
        x1 = x_top;
        y1 = find_y(a,b,c,x1);
        x2 = x1 - 0.5;
        y2 = find_y(a,b,c,x2);
        draw_graph(x1,y1,x2,y2);
        x_top = x2;
    }
    
    for(var j = 0; j < 20; j++) {
        x1 = x_top;
        y1 = find_y(a,b,c,x1);
        x2 = x1 + 1;
        y2 = find_y(a,b,c,x2);
        draw_graph(x1,y1,x2,y2);
        x_top = x2;
    }
}

else if (x_top !== 0) { //if a < 0
    for(i = 0; i < 20; i++) {
        x1 = x_top;
        y1 = find_y(a,b,c,x1);
        x2 = x1 - 0.5;
        y2 = find_y(a,b,c,x2);
        draw_graph(x1,y1,x2,y2);
        x_top = x2;
    }
    x_top = -x_top; //to get the other side of the graph
    
    for(j = 0; j < 20; j++) {
        x1 = x_top;
        y1 = find_y(a,b,c,x1);
        x2 = x1 - 0.5;
        y2 = find_y(a,b,c,x2);
        draw_graph(x1,y1,x2,y2);
        x_top = x2;
    }
}