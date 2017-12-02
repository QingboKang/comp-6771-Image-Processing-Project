
img = imread('IMG_3493.JPG');
imgR = img(:, :, 1);
imgG = img(:, :, 2);
imgB = img(:, :, 3);

img_equ(:, :, 1) = histeq(img(:, :, 1));
img_equ(:, :, 2) = histeq(img(:, :, 2));
img_equ(:, :, 3) = histeq(img(:, :, 3));

imwrite(img_equ, 'out.png');

%% 
target = imread('t2.PNG');
targetR = target(:, :, 1);
targetG = target(:, :, 2);
targetB = target(:, :, 3);

Rmatch_hist = imhist(targetR);
Gmatch_hist = imhist(targetG);
Bmatch_hist = imhist(targetB);

Rmatch = histeq(imgR, Rmatch_hist);
Gmatch = histeq(imgG, Gmatch_hist);
Bmatch = histeq(imgB, Bmatch_hist);

img_matching(:, :, 1) = Rmatch;
img_matching(:, :, 2) = Gmatch;
img_matching(:, :, 3) = Bmatch;

imwrite(img_matching, 'matching.png');
