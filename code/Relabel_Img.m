function [ reI ] = Relabel_Img( I, C, w, T1, T2)
%RELABEL_IMG relabel the near-text pixel in the image I
% I: the original image I
% C: the contrast image C
% w: stroke width
% output image: reI 


% image size
[M, N] = size(I);
reI = ones([M, N]);

ii = 1;
while ii < M
    jj = 1;
    while jj < N

        if ii >= M 
            break;
        end
        if jj >= N
            continue;
        end
        
        if( C(ii, jj) >= T1 )
            [Num, I_mean, I_std] = Relabel_Reg(I, C, ii, jj, T1, T2, w);
            if( I(ii, jj) < min(I_mean + I_std, T2) && Num > 0 )
                I(ii, jj) = 1;
                reI(ii, jj) = 1;
            else 
                I(ii, jj) = 0;
                reI(ii, jj) = 0;
            end
            ii = ii + w;
            jj = jj + w;
        else
            ii = ii + 1;
            jj = jj + 1;
        end % end if
        
    end
end


end

