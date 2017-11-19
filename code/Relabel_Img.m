function [ reI ] = Relabel_Img( I, C )
%RELABEL_IMG relabel the near-text pixel in the image I
% I: the original image I
% C: the contrast image C
% output image: reI 

% obtain two threshold
[T1, T2] = doubleThresh( I );

% image size
[M, N] = size(I);

for ii = 1 : M
    for jj = 1 : N
        if( C(ii, jj) >= T1 )
            [Num, I_mean, I_std] = Relabel_Reg(I, C, ii, jj, T1, T2);
            if( I(ii, jj) < min(I_mean + I_std, T2) && Num > 0 )
                I(ii, jj) = 1;
            else 
                I(ii, jj) = 0;
            end
            ii = ii + w;
            jj = jj + w;
        end % end if
    end
end

reI = I;



end

