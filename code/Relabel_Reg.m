function [ Num, I_mean, I_std ] = Relabel_Reg( I, C, ii, jj, T1, T2 )
%RELABEL_REG relabel the next text pixels in the image
% I: the original image
% C: the contrast image
% ii, jj: image coordinate
% T1, T2: two thresholding values
% Num: the number of high contrast pixels
% I_mean, I_std: the mean and the standard deviation of these pixels

w = 3;

Num = 0;
I_mean = 0;
I_std = 0;

[height, width] = size(C);

for x = ii - w : ii + w
    for y = jj - w : jj + w 
        if( (x >= 1 && x <= height) && (y >= 1 && y <= width))
            if(C(x, y) >= T1)
                C(x, y) = 1;
                Num = Num + 1;
            else
                C(x, y) = 0;
            end  % end if
        end
    end
end

% mean
if (Num > 0)
    
end



end
