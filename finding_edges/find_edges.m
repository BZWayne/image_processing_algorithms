% Defining the maskx and masky for Sobel Operators

Gx = [-1,0,1;-2,0,2;-1,0,1];
Gy = [-1,-2,-1;0,0,0;1,2,1];

% Upload an image

image = imread('house.jpg');
image = rgb2gray(image);
image = double(image);
[row, col] = size(image);
thresh = 150;

% Sizes of masks Gx and Gy
[row_x, col_x] = size(Gx);
a = (row_x-1)/2;
b = (col_x-1)/2;

% Padding
img = zeros(row+2*a ,col+2*b);
for r = 1:row
    for c = 1:col
        img(r+a, c+b) = image(r, c);
    end
end

% Mask Gx
fx = zeros(row,col);
for r = 1:row
    for c = 1:col
        pixel = Gx.*img(r:(r+2*a), c:(c+2*b));
        fx(r,c) = sum(sum(pixel));
    end
end

% Mask Gy
fy = zeros(row,col);
for r = 1:row
    for c = 1:col
        pixel = Gy.*img(r:(r+2*a), c:(c+2*b));
        fy(r,c) = sum(sum(pixel));
    end
end

% Combined masks
f = sqrt((fx).^2 + (fy).^2);

for r = 1:row
    for c = 1:col
        if f(r,c) > thresh
            f(r,c) = 255;
        else
            f(r,c) = 0;
        end
    end
end

subplot(2,2,1), imagesc(image), title('Original Image'), colormap(gray);
subplot(2,2,2), imagesc(fx), title('Image with mask Gx'), colormap(gray);
subplot(2,2,3), imagesc(fy), title('Image with mask Gy');
subplot(2,2,4) ,imagesc(f), title('Sobel Image'), colormap(gray);
