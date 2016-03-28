var items = new Array(10);

for(var j = 0; j< 5;++j){
       items[j] = j.toString();
}


    for(var k = 0; k<5;++k){
        text(items[k],70,k*40);
        fill(1,1,1,31);
        rect(60, k*60, 50, 50);
        
        
        
    }

