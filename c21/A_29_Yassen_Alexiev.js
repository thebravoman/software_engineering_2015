var matrix = function(matrix){
    for(var j = 0; j < matrix.length; j++){
        for(var i = 0; i < matrix[j].length; i++){
            fill(0, 255, 0);
            rect(j * 80, i * 80, 80, 80);
            fill(0, 0, 0);
            text(matrix[i][j], j * 80 + 80 * 0.3, i * 80 + 80 / 2);
        }
    }
};

matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);