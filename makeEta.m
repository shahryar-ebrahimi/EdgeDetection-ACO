function [ eta ] = makeEta( img,method )

if strcmp(method,'proposed')==1
    
    Imax = max(img(:));
    eta = zeros(size(img));
    
    [size_x,size_y] = size(img);
    for i=1:size_x
        for j=1:size_y
            
            maxNum=0;
            for u=0:2
                for v=-2:2
                    if (i-u)>=1 && (j-v)>=1 && (j-v)<=size_y && (i+u)<=size_x && (j+v)>=1 && (j+v)<=size_y
                        temp = abs(img(i-u,j-v)-img(i+u,j+v));
                        if temp > maxNum
                            maxNum = temp;
                        end
                    end
                end
            end
            eta(i,j)=maxNum;
            
        end
    end
    eta = eta / Imax;
    Imax = max(img(:));
    eta = zeros(size(img));
    
    [size_x,size_y] = size(img);
    for i=1:size_x
        for j=1:size_y
            
            maxNum=0;
            for u=0:2
                for v=-2:2
                    if (i-u)>=1 && (j-v)>=1 && (j-v)<=size_y && (i+u)<=size_x && (j+v)>=1 && (j+v)<=size_y
                        temp = abs(img(i-u,j-v)-img(i+u,j+v));
                        if temp > maxNum
                            maxNum = temp;
                        end
                    end
                end
            end
            eta(i,j)=maxNum;
            
        end
    end
    eta = eta / Imax;
    
elseif strcmp(method,'NAP')==1
    
    Imax = max(img(:));
    eta = zeros(size(img));
    
    [size_x,size_y] = size(img);
    for i=1:size_x
        for j=1:size_y
            
            maxNum=0;
            for u=0:1
                for v=-1:1
                    if (i-u)>=1 && (j-v)>=1 && (j-v)<=size_y && (i+u)<=size_x && (j+v)>=1 && (j+v)<=size_y
                        temp = abs(img(i-u,j-v)-img(i+u,j+v));
                        if temp > maxNum
                            maxNum = temp;
                        end
                    end
                end
            end
            eta(i,j)=maxNum;
            
        end
    end
    eta = eta / Imax;
    
elseif strcmp(method,'TIAN')==1
    
    Imax = max(img(:));
    eta = zeros(size(img));
    
    [size_x,size_y] = size(img);
    for i=1:size_x
        for j=1:size_y
            
            maxNum=0;
            for u=0:2
                for v=-2:2
                    if (i-u)>=1 && (j-v)>=1 && (j-v)<=size_y && (i+u)<=size_x && (j+v)>=1 && (j+v)<=size_y
                        if ~((u==0 || u==2) && (v==-2 || v==2))
                            temp = abs(img(i-u,j-v)-img(i+u,j+v));
                            if temp > maxNum
                                maxNum = temp;
                            end
                        end
                    end
                end
            end
            eta(i,j)=maxNum;
            
        end
    end
    eta = eta / Imax;
    
end

end

