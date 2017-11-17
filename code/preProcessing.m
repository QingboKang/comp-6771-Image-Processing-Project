function [ contrast_img ] = preProcessing( orig_img )
% contrast estimation

img_size=size(orig_img);
if numel(img_size)>2
    orig_img = rgb2gray(orig_img);
end

% adjust image
adjust_img = imadjust(orig_img);

% extract background image using the gray-level morphological closing
% operation
SE = strel('square',5);
bg_img = imclose(adjust_img, SE);

% subtracting the original from the background one, obtained contrast image
contrast_img = imsubtract(bg_img, orig_img);

imshow(orig_img), title('original');
figure, imshow(adjust_img), title('adjust');
figure, imshow(bg_img), title('background');
figure, imshow(contrast_img), title('contrast');

end

