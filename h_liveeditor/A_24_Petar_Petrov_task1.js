// Setting up coord system
+var center_x = 200;
+var center_y = 200;
+var field_width = 400;
+var field_height = 400;
+var line_start_x = 20;
+var line_start_y = 20;
+var line_end_x = field_width - line_start_x;
+var line_end_y = field_height - line_start_y;
+fill(237, 19, 19);
+line(line_start_x,center_y,line_end_x,center_y);
+line(center_x,line_start_y,center_x,line_end_y);
+//Positive x
+for(var c=1; c<=6; c++) {
+    text(c,center_x+30*c,center_y+3,10,20);
+}
+
+//Positive y
+for(var c=1; c<=6; c++) {
+    text(c,center_x+3,center_y-30*c,20,20);
+}
+
+//Negative x
+for(var c=1; c<=6; c++) {
+    text(-c,center_x-30*c,center_y+3,20,20);
+}
+
+//Negative y
+for(var c=1; c<=6; c++) {
+    text(-c,center_x+3,center_y+30*c,20,20);
+}
+
+//Equation
+var a = 5;
+var b = 2;
+var y1;
+var x1;
+var y2;
+var x2;
+var findX = function(a,b,y) {
+    return ((y-b)/a);
+};
+var findY = function(a,b,x) {
+    return ((a*x)+b);
+};
+var drawLine = function(x1,y1,x2,y2) {
+    line(30*x1+center_x,center_y-30*y1,30*x2+center_x,center_y-30*y2);
+};
+
+//For values of x
+x1 = 0;
+y1 = findY(a,b,x1);
+
+//For values of y
+y2 = 0;
+x2 = findX(a,b,y2);
+//Draws line
+drawLine(x1,y1,x2,y2);
+//Continues drawing
+if(y1 > y2) {
+    y1 = y2;
+    x1 = x2;
+    y2 = -1;
+    x2 = findX(a,b,y2);
+    drawLine(x1,y1,x2,y2);
+    
+    y1 = y2;
+    x1 = x2;
+    y2 = -2;
+    x2 = findX(a,b,y2);
+    drawLine(x1,y1,x2,y2);
+}
+else if(y1 < y2) {
+    y1 = y2;
+    x1 = x2;
+    y2 = 1;
+    x2 = findX(a,b,y2);
+    drawLine(x1,y1,x2,y2);
+}
