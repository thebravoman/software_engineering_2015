var arr = [[1, 2, 3],[1, 2, 3]];

var i;
var j;
var y_indent = 20;
var x_indent = 20;

for ( i = 0 ; i < 2 ; i++ ) {
    for ( j = 0 ; j < 3 ; j++ ) {
        rect(x_indent,y_indent,20,20,0);
        y_indent += 25; 
        fill(0, 0, 0);
        text(arr[i][j], x_indent+ 7, y_indent - 10);
        fill(255, 255, 255);
    }
    y_indent = 20;
    x_indent += 25;
}
