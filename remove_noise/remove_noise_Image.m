% Upload an image and apply a noise to the image
image = imread('donald.jpg');
image = rgb2gray(image);
image = imnoise(image,'salt & pepper',0.05);

[row, col] = size(image);

% Mask for median filtering 3x3, m and n values can be changed
m = 3;
n = 3;

a = (m-1)/2;
b = (n-1)/2;

img = zeros(row+2*a ,col+2*b);
for r = 1:row
    for c = 1:col
        img(r+a, c+b) = image(r, c);
    end
end

pixel = zeros(row,col);
pixel = uint8(pixel);

for r = 1:row
    for c = 1:col
        A = img(r:r+m-1, c:c+n-1);
        A = reshape(A.',1,[]);
        pixel(r,c) = median(A);
    end
end

subplot(1,2,1); imshow(image); title('Noisy image salt & pepper');
subplot(1,2,2); imshow(pixel); title('Median filtered image');