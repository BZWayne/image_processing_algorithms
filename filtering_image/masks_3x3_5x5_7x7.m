% Defining the mask, if you want to change mask, change here

mask = [1,2,3,5,6;4,5,6,8,8;7,8,10,9,9];

% Try 7x7 matrix

% mask = [1,2,3,4,5,6,7;8,9,10,11,12,13,14;15,16,17,18,19,20,21];

% Upload an image

image = imread('donald.jpg');
image = rgb2gray(image);
image = double(image);
[row, col] = size(image);

[m, n] = size(mask);
a = (m-1)/2;
b = (n-1)/2;

img = zeros(row+2*a ,col+2*b);

for r = 1:row
    for c = 1:col
        img(r+a, c+b) = image(r, c);
    end
end

f = zeros(row ,col);
for r = 1:row
    for c = 1:col
        pixel = mask.*img(r:(r+2*a), c:(c+2*b));
        f(r,c) = sum(sum(pixel)) / sum(sum(mask));
    end
end

imshow(f, [min(min(f)) max(max(f))]);