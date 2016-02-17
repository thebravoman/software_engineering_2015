var RECT_WIDTH = 20;
var RECT_HEIGHT = 20;

var drawRect = function (offset_x, offset_y, digit) {
    rect(offset_x, offset_y, RECT_WIDTH, RECT_HEIGHT);
    fill(255, 0, 0);
    text(digit, offset_x + 3, offset_y + 15);
    fill(255, 255, 255);
};

var drawMatrix = function (w, h) {
    var x_offset = 0;
    var y_offset = 0;
    var digit = 1;
    
    for (var i = 0; i < w; i++) {
        for (var j = 0; j < h; j++) {
            drawRect(x_offset, y_offset, digit);
            x_offset += RECT_WIDTH;
            digit += 1;
        }
        
        x_offset = 0;
        y_offset += RECT_HEIGHT;
    }
};

drawMatrix(5, 5);
