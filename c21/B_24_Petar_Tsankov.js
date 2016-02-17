var draw_r= function(m,x,y){
    for(var i=0;i<x;i++){
        for(var j=0;j<y;j++){
            fill(255, 0, 0);
            rect(i*20,j*20,18,18);
            fill(255, 255, 255);
            text(""+m[i][j],i*20+(11-textWidth(""+m[i][j]))/2 + 3,j*20 +15);
        }
    }
};
var a=[];
var c=10;
var d=10;
for(var i=0;i<c;i++){
    a[i]=[];
    for(var j=0;j<d;j++){
        a[i][j]=i*c+j;
    }
}
draw_r(a,c,d);
