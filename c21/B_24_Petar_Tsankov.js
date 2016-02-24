var draw_r= function(m,x,y,d){
    for(var i=0;i<x;i++){
        for(var j=0;j<y;j++){
            fill(255, 0, 0);
            rect(i*10*d,j*20,9*d,18);
            fill(255, 255, 255);
            text(""+m[i][j],i*10*d+((7*d)-textWidth(""+m[i][j]))/2 + 3,j*20 +15);
        }
    }
};
var a=[];
var c=13;
var d=20;
var di=3;
for(var i=0;i<c;i++){
    a[i]=[];
    for(var j=0;j<d;j++){
        a[i][j]=+i*d+j;
    }
}
draw_r(a,c,d,di);
