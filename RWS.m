function dirx=RWS(P)
r=rand;
C=cumsum(P);
dirx=find(r<=C,1,'first');
end