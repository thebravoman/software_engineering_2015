var draw_matrix = function(matrix){
    var RECT_WIDTH = 50;
    var RECT_HEIGHT = 50;
    
    for(var i = 0; i < matrix.length; i++){
        for(var j = 0; j < matrix[i].length; j++){
            fill(255, 255, 255);
            rect(i * RECT_WIDTH, j * RECT_HEIGHT, RECT_WIDTH, RECT_HEIGHT);
            fill(0, 0, 0);
            text(matrix[i][j], i * RECT_WIDTH + RECT_WIDTH * 0.3, j * RECT_HEIGHT + RECT_HEIGHT / 2);
        }
    }
};

draw_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);