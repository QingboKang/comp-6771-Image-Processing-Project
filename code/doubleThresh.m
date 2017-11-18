function [ T1, T2 ] = doubleThresh( img )
%DOUBLETHRESH implement algorithm 2
% Ternarization system using 1-D histogram Shannon based entropy
% input: img - grayscale image
% output: T1, T2 - two threshold values

% ensure grayscale
if numel(size(img)) > 2
    img = rgb2gray(img);
end

% initialization
MAXIMUM_K = 0;
T1 = 0;
T2 = 0;

[height, width] = size(img);

% compute histogram data
H = imhist(img);
P = H ./ (height * width);



for t1 = 1 : 255
    for t2 = t1+1 : 255
        Hb = 0;
        Hbw = 0;
        Hw = 0;

        Pb = sum(P(1 : t1));
        Pbw = sum(P(t1+1 : t2));
        Pw = sum(P(t2+1 : 256));
        
        % entropy for b group
        if(Pb > 0)
            for ii = 1 : t1
                Hb = Hb - (P(ii) / Pb) * log(P(ii) / Pb);
            end
        end
        
        % entropy for bw group
        if(Pbw > 0)
            for ii = t1 + 1 : t2
                Hbw = Hbw - (P(ii) / Pbw) * log(P(ii) / Pbw);
            end
        end
        
        % entropy for w group
        if (Pw > 0)
            for ii = t2 + 1 : 256
                Hw = Hw - (P(ii) / Pw) * log(P(ii) / Pw);
            end
        end 
        
        % total entropy
        Hs = Hb + Hbw + Hw;
        if Hs > MAXIMUM_K
            MAXIMUM_K = Hs;
            T1 = t1;
            T2 = t2;
        end
    end
end


end

