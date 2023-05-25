function outAnt = whatsNext(ant,tau,eta,alpha,beta )

[size_x,size_y] = size(eta);

temp = ant.rs;
r = temp(1);
s = temp(2);

P = zeros(1,8);

%% #1
if s==size_y || isVisited(ant,r,s+1)==1
    P(1)=0;
else
    diff_tau = tau(r,s+1);
    diff_eta = eta(r,s+1);
    
    P(1) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% #2
if s==size_y || r==1 || isVisited(ant,r-1,s+1)==1
    P(2)=0;
else
    diff_tau = tau(r-1,s+1);
    diff_eta = eta(r-1,s+1);
    
    P(2) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% #3
if r==1 || isVisited(ant,r-1,s)==1
    P(3)=0;
else
    diff_tau = tau(r-1,s);
    diff_eta = eta(r-1,s);
    
    P(3) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% #4
if s==1 || r==1 || isVisited(ant,r-1,s-1)==1
    P(4)=0;
else
    diff_tau = tau(r-1,s-1);
    diff_eta = eta(r-1,s-1);
    
    P(4) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% #5
if s==1 || isVisited(ant,r,s-1)==1
    P(5)=0;
else
    diff_tau = tau(r,s-1);
    diff_eta = eta(r,s-1);
    
    P(5) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% #6
if s==1 || r==size_x || isVisited(ant,r+1,s-1)==1
    P(6)=0;
else
    diff_tau = tau(r+1,s-1);
    diff_eta = eta(r+1,s-1);
    
    P(6) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% #7
if r==size_x || isVisited(ant,r+1,s)==1
    P(7)=0;
else
    diff_tau = tau(r+1,s);
    diff_eta = eta(r+1,s);
    
    P(7) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% #8
if s==size_y || r==size_x || isVisited(ant,r+1,s+1)==1
    P(8)=0;
else
    diff_tau = tau(r+1,s+1);
    diff_eta = eta(r+1,s+1);
    
    P(8) = (diff_tau^alpha)*(diff_eta^beta)+eps;
end

%% RWS
outAnt = ant;
P=P/sum(P);
dir = RWS(P);
if isempty(dir)
    r = randi([1,size_x],1,1);
    s = randi([1,size_y],1,1);
    outAnt.rs = [r,s];
    outAnt.visitedNodes =  addNode(ant,r,s);
else
    sr = [0,-1,-1,-1,0,1,1,1];
    ss = [1,1,0,-1,-1,-1,0,1];
    r = r + sr(dir);
    s = s + ss(dir);
    outAnt.rs = [r,s];
    outAnt.visitedNodes =  addNode(ant,r,s);
end

end