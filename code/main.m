% main script of COMP 6771 final project
% by Qingbo Kang

clc, clear;
close all;

% read image
% img = imread('3_10.jpg');
img = imread('H02.bmp');

% convert rgb to grayscale
if numel(size(img)) > 2
    img = rgb2gray(img);
end

[height, width] = size(img);


%% contrast estimation
% obtain contrast image - pre processing
[contrast_img] = preProcessing( img);

%% double threshold binarization
% phase 1

% generate two threshold
[T1, T2] = doubleThresh( contrast_img );

% classification

% phase 2: relabel the misclassified regions
M = CalcStrokeWidth(contrast_img);
[reI] = Relabel_Img(img, contrast_img, M, T1, T2);


for ii = 1 : height
    for jj = 1 : width
        % text 
        if(contrast_img(ii, jj) <= T1)
            reI(ii, jj) = 1;
        % near-text
        elseif (contrast_img(ii, jj) > T1 && contrast_img(ii, jj) < T2)
        % non-text
        else
            reI(ii, jj) = 0;
        end

    end
end

imwrite(reI, 'bin1.png')

%% postProcessing
[outImg] = postProcessing(reI, M, contrast_img);