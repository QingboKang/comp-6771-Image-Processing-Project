function [  ] = ShowRGBHist( rgbImg )
%SHOWRGBHIST 

% split R G B channels
imgR = rgbImg(:, :, 1);
imgG = rgbImg(:, :, 2);
imgB = rgbImg(:, :, 3);

figure;  
subplot(311);imhist(imgR);title('histogram of Red');  
subplot(312);imhist(imgG);title('histogram of Green');  
subplot(313);imhist(imgB);title('histogram of Blue');  


end

