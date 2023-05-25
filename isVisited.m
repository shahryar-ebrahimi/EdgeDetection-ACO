function result = isVisited(Ant,x,y)

temp = Ant.visitedNodes;
[temp_size_x,temp_size_y] = size(temp);

result = 0;
for i=1:temp_size_x
    if temp(i,1)==x && temp(i,2)==y
        result=1;
        break;
    end
end

end

