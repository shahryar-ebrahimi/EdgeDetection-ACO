function showAnts( gray_img,Ants)

displayImg = cat(3,gray_img,gray_img,gray_img);

for i=1:length(Ants)
    temp = Ants(i).rs;
    x = temp(1);y=temp(2);
    
    displayImg(x,y,1)=1;
    displayImg(x,y,2)=0;
    displayImg(x,y,3)=0;
end
figure();imshow(displayImg);

end

