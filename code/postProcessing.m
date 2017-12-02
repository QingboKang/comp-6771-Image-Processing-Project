function [ outImg ] = postProcessing( inImg, M)
%POSTPROCESSING

%% strategy 1: remove salt and pepper noise
% apply binary morphological opertators

% bridges unconnected pixels
outImg = bwmorph(inImg, 'bridge');

% remoives isolated pixels
outImg = bwmorph(outImg, 'clean');

% fills isolated interior pixels
outImg = bwmorph(outImg, 'fill');

% removes spur pixels
outImg = bwmorph(outImg, 'spur');

imwrite(outImg, 'bin_remove1.png')

% correct the areas that are larger than one pixels and smaller than the
% character stroke width by using shrink and swell filters.
[height width] = size(inImg);
r1 = M;
r2 = M;

nr1 = floor(height / r1);
nr2 = floor(width / r2);
num_1 = 0;
num_2 = 0;

for ii = 0 : nr1 - 1
    for jj = 0 : nr2 - 1
        num_1 = 0;
        num_2 = 0;
        
        for m = 1 : r1
            for n = 1 : r2
                if(outImg((ii * r1) + m, (jj*r2) + n) == 1)
                    if( m < r1 && n <r2 )
                        num_2 = num_2+1;
                    end
                    num_1 = num_1 + 1;
                end
            end
        end
        if(num_1 == num_2)

            outImg( (ii*r1)+1 : (ii*r1)+r1-1, (jj*r2)+1 : (jj*r2)+r2-1 ) = 0;
        elseif (num_1 == num_2 + 2*(r1+r2-2))

            outImg( (ii*r1)+1 : (ii*r1)+r1-1, (jj*r2)+1 : (jj*r2)+r2-1 ) = 1;
        end
    end
end

imwrite(outImg, 'bin_remove2.png')

%% strategy 2: remove block noise


end

