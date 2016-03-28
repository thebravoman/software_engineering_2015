var i, x1, y1, x2, y2;
var a, b, draw_x = 10, draw_y = 200;
a = 2;
b = 7;

line(0,200,400,200);
line(200,0,200,400);

var Draw = function()
{
    fill(9, 40, 242);
    for(i = 9; i >= 1; i--) {
        text(-i,draw_x,draw_y);
        text(i,draw_y,draw_x);
        draw_x += 21;
    }
    draw_x += 30;
    for(i = 1; i < 10; i++) {
        text(i,draw_x,draw_y);
        text(-i,draw_y,draw_x + 15);
        draw_x += 21;
    }
};
var Equation = function()
{
    x1 = -b/a;
    y1 = -0;
    
    x2 = 0;
    y2 = b;
    
    fill(0, 0, 0);
    line(x1*20+200,200-25*y1,x2*20+200,200-y2*25);
};
Draw();
Equation();