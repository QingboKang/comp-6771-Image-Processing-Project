function [ contrast_img ] = preProcessing( orig_img )
% contrast estimation

img_size=size(orig_img);
if numel(img_size)>2
    orig_img = rgb2gray(orig_img);
end


% adjust image
adjust_img = imadjust(orig_img);

% min max value
min_value1 = min(orig_img(:))
max_value1 = max(orig_img(:))

min_value2 = min(adjust_img(:))
max_value2 = max(adjust_img(:))




end

