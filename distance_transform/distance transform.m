image = imread('tiger.jpg');
image = im2bw(image);  %convert to black and white
imshow(image)
[row, col] = size(image);  %take values
pixel = zeros(row, col);  
% 0 - background
% 1 - forground
x = 1;
y = max(row, col);
for x = 1:y
    for r = 1:row
        for c = 1:col
            % Boundaries
            if (image(r,c) == 0) && ((image(r-1,c) == 1) || (image(r+1,c) == 1) || (image(r,c-1) == 1) || (image(r,c+1) == 1))
                pixel(r,c) = 1;
            end

            if x == 1
                continue 
            elseif (image(r,c) == 0) && (pixel(r,c) == 0) && ((pixel(r-1,c) == (x-1)) || (pixel(r+1,c) == (x-1)) || (pixel(r,c-1) == (x-1)) | (pixel(r,c+1) == (x-1)))
                pixel(r,c) = x;
            end
            
            %Four main corners and boundaries that we must consider
            if r == 1 && c == 1
                if (image(r, c) == 0) && (image(r, c+1) == 1 || image(r+1, c) == 1)
                    pixel(r,c) = 1;
                    continue
                end
            end
       
            if r == 1 && c ~= col
                if (image(r, c) == 0) && (image(r+1, c) == 1 || image(r, c-1) == 1 || image(r, c+1) == 1)
                    pixel(r,c) = 1;
                    continue
                end
            end
       
            if r == 1 && c == col
                if (image(r, c) == 0) && (image(r, c-1) == 1 || image(r+1, c) == 1)
                    pixel(r,c) = 1;
                    continue
                end
            end
       
            if r ~= row && c == col
                if (image(r, c) == 0) && (image(r+1, c) == 1 || image(r-1, c) == 1 || image(r, c-1) == 1)
                    pixel(r,c) = 1;
                end
            end
       
            if r == row && c == col
                if (image(r, c) == 0) && (image(r, c-1) == 1 || image(r-1, c) == 1)
                    pixel(r,c) = 1;
                    continue
                end
            end
       
            if r == row  && c ~= col
                if (image(r, c) == 0) && (image(r-1, c) == 1 || image(r, c-1) == 1 || image(r, c+1) == 1)
                    pixel(r,c) = 1;
                    continue
                end
            end
       
            if r == row  && c == 1
                if (image(r, c) == 0) && (image(r, c+1) == 1 || image(r-1, c) == 1)
                    pixel(r,c) = 1;
                    continue
                end
            end
       
            if r ~= row  && c == 1
                if (image(r, c) == 0) && (image(r, c+1) == 1 || image(r+1, c) == 1 || image(r-1, c) == 1)
                    pixel(r,c) = 1;
                    continue
                end
            end     
        end
    end
end

% Normalization to 255 values so that matrix starts from 3,6,9..255
normal = max(pixel, [], 'all');
for r = 1:row
    for c = 1:col
        pixel(r,c) = floor(pixel(r,c)*(255/normal));
    end
end

%Plot the original and transformed images
figure 
subplot(1,2,1); imshow(image)
subplot(1,2,2); imshow(pixel, [])