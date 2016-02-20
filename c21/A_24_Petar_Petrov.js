var matrix_cols = 5; 
var matrix_rows = 7; 
var matrix = new Array(matrix_rows); 
for(var i=0; i<matrix_rows; i++) {     
	matrix[i] = new Array(matrix_cols);     
	for(var c=0; c<matrix_cols; c++) {         
		matrix[i][c] = (i+1)*c;     
	} 
} 
var Draw = function (matrix,rows,cols) {  
   var matrix_x = 5;     
   var matrix_y = 5;   
   fill(212, 30, 30);     
   for(var i=0; i<rows; i++) {         
		 for(var c = 0; c<cols; c++) {       
   		 text(matrix[i][c],matrix_x,matrix_y,20,20);             
   		 matrix_x += 20;         
   	 }         
   	 matrix_x = 5;         
   	 matrix_y += 20;     
   } 
};  
Draw(matrix, matrix_rows, matrix_cols);

