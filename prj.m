%% initializing
clc
clear
close all

%% achieve IMG
img = im2double(imread('cameraman.jpg'));
if numel(size(img))==3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

figure();
imshow(gray_img)

% add noise
noiseVar = 0.01;
gray_img = imnoise(gray_img,'gaussian',0,noiseVar);

figure();imshow(gray_img);
[size_x,size_y] = size(gray_img);
edges = edge(gray_img,'canny');
figure();imshow(edges);

%% Parameters
tau0 = 0.0001;
m = floor(3*sqrt(size_x*size_y));     % number of ants
L = floor(3*sqrt(size_x*size_y));     % steps
N = 3;                              % iteration
alpha = 2;
beta = 2;
rho = 0.02;
t=0.4;

%% my ACO
result = myACO(gray_img,tau0,m,L,N,alpha,beta,rho,t);
imshow(result>eps);
