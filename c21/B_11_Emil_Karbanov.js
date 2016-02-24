var array = [0,1,2,3,4,5,6,7,8,9];
var arraySize = array.length;
var i,d,c, x=0;
var x1=0;
var x2=0;
for (i = 0; i < arraySize; i++) {
rect(x,0,20,20);
x+=25;
}
for (c = 0; c < arraySize; c++) {
rect(x1,30,20,20);
x1+=25;
}
for (d = 0; d < arraySize; d++) {
rect(x2,60,20,20);
x2+=25;
}
