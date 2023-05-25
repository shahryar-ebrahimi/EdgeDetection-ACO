function [ tau ] = myACO( gray_img,tau0,m,L,N,alpha,beta,rho,t )
%% ACO initializing
[size_x,size_y] = size(gray_img);

tau = zeros(size(gray_img))+ tau0;

eta = makeEta(gray_img,'proposed');
figure();imshow(eta);

simpleAnt.visitedNodes = [];
simpleAnt.rs = [];
Ants = repmat(simpleAnt,1,m);

for k=1:m
    x = randi([1,size_x]);
    y = randi([1,size_y]);
    Ants(k).rs = [x,y];
    Ants(k).visitedNodes =  addNode(Ants(k),x,y);
end
showAnts(gray_img,Ants);

%% ACO main LOOP
for i=1:N
    for j=1:L
        for k=1:m
            Ants(k) = whatsNext(Ants(k),tau,eta,alpha,beta);
        end
        % update phromones
        tau = (1-rho)*tau;
        for k=1:m
            temp = Ants(k).rs;
            r = temp(1);
            s = temp(2);
            if eta(r,s)>t
                tau(r,s) = tau(r,s) + eta(r,s);
            end
        end
    end
end
end

