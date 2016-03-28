var asize = 4;
var i = 0;
var arr = new Array(asize);
for(i=0;i<asize;i+=1) {
    fill(0,0,255);
    rect(i*40,20,30,30);
    fill(255,0,0);
    text(i,i*41,30);
}
