% main script of COMP 6771 final project
% by Qingbo Kang

clc, clear;
close all;

% read image
img = imread('3_10.jpg');

% convert rgb to grayscale
if numel(size(img)) > 2
    img = rgb2gray(img);
end

[height, width] = size(img);

M = CalcStrokeWidth(img);

%% contrast estimation
% obtain contrast image - pre processing
contrast_img = preProcessing( img );

%% double threshold binarization
% phase 1

% generate two threshold
[T1, T2] = doubleThresh( contrast_img );

% classification
C = zeros([height, width]);

for ii = 1 : height
    for jj = 1 : width
        % text 
        if(contrast_img(ii, jj) <= T1)
            C(ii, jj) = 0;
        % near-text
        elseif (contrast_img(ii, jj) > T1 && contrast_img(ii, jj) < T2)
            C(ii, jj) = 0.5;
        % non-text
        else
            C(ii, jj) = 1;
        end

    end
end

imwrite(C, 'bin.png');