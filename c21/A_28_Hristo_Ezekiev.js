var Matrix = function(rows, cols)
{
    var x = 0;
    var y = 0;
    for(var i=0;i<rows;++i)
    {
        
        rect(x, y, 20, 20);
        for(var t=0;t<cols-1;++t)
        {
            y = y + 25;
            rect(x, y, 20, 20);
        }
        x = x + 25;
        y = 0;
    }
};

var rows=3;
var columns=4;
Matrix(rows, columns);
