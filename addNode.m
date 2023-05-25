function VN = addNode(Ant,x,y)

temp = Ant.visitedNodes;
B = [x,y];
VN = vertcat(temp,B);

end

