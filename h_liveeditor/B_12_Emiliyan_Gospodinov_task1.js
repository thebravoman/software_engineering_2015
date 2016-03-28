var a_const = 0;
var b_const = 10;
var x;
if(a_const!==0){
    x = -b_const/a_const;
    if(a_const>0){
        line(x, 200,200-a_const,b_const);
    }else {
        line(x,b_const,200+a_const, 200);
    }
} else{
    line(0, 200,200,200);
}
