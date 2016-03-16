var count;
line(10,200,390,200);
line(200,10,200,390);
for(count = -5; count <=5; count++){
    fill(0, 0, 0);
    if(count!==0){
        text(count*38,196 + 38*count,205, 50, 50);
    }
    rect(199 + 38*count,199,2,2,10);
    
    if(count!==0){
        text(-count*38,205,199 + 37*count, 50, 50);
    } else{
        text(-count*38,205,205 + 37*count, 50, 50);
    }
    rect(199,199 + 38*count,2,2,10);
}
var a_const = 0.1;
var b_const = 1;
var c_const = 1;
var d = b_const*b_const - 4*a_const*c_const;
var x1=-200,x2=200, o = 200;
for(var i = -200; i <= 200 ; i++){
    stroke(255, 0, 0);
    var y = a_const*i*i + b_const*i + c_const;
    var y1 = a_const*(i+1)*(i+1) + b_const*(i+1) + c_const;
    line(i+200,200-y,i+201,200-y1);
}
