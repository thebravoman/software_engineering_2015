var quadric = function(a, b, c){
    var graph_line_count = 1000;
    var x_ordinate = 50;
    var y_ordinate = 200;
    var points_graph = [];
    var x = -34;
    
    for(var i = 0; i < graph_line_count; i++){
        var y = a * x * x + b * x + c;
        points_graph[i] = [x, y];
        x += 1;
    }
    
    for(var i = 0; i < graph_line_count - 1; i++){
        line(points_graph[i][0] + x_ordinate, points_graph[i][1] + y_ordinate, points_graph[i + 1][0] + x_ordinate, points_graph[i + 1][1] + y_ordinate);
    }
};

quadric(1, 1, 2);
