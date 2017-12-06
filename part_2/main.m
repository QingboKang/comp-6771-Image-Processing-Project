
clear, clc;
close all;
%% 1. apply histogram equalization to the image
img = imread('IMG_3493.JPG');

% gaussian filter
w = fspecial('gaussian',[5 5],3);
img = imfilter( img, w);

% split R G B channels
imgR = img(:, :, 1);
imgG = img(:, :, 2);
imgB = img(:, :, 3);

% do histogram equalization
img_equ(:, :, 1) = histeq(img(:, :, 1));
img_equ(:, :, 2) = histeq(img(:, :, 2));
img_equ(:, :, 3) = histeq(img(:, :, 3));

% write image file
imwrite(img_equ, 'equ_result.png');

% show result images
figure, imshow(img), title('original image');
figure, imshow(img_equ), title('histogram equalization result');
% show histograms
ShowRGBHist(img);
ShowRGBHist(img_equ);

%% apply histogram matching 
target = imread('t3.jpg');
targetR = target(:, :, 1);
targetG = target(:, :, 2);
targetB = target(:, :, 3);

Rmatch_hist = imhist(targetR);
Gmatch_hist = imhist(targetG);
Bmatch_hist = imhist(targetB);

% do histogram matching
Rmatch = histeq(imgR, Rmatch_hist);
Gmatch = histeq(imgG, Gmatch_hist);
Bmatch = histeq(imgB, Bmatch_hist);

img_matching(:, :, 1) = Rmatch;
img_matching(:, :, 2) = Gmatch;
img_matching(:, :, 3) = Bmatch;

% write image file
imwrite(img_matching, 'matching.png');

% show result images
figure, imshow(img_equ), title('histogram equalization result');
figure, imshow(img_matching), title('histogram matching result');
% show histograms
ShowRGBHist(target);
ShowRGBHist(img_matching);
