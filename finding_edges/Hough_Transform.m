% Defining the maskx and masky for Sobel Operators
Gx = [-1,0,1;-2,0,2;-1,0,1];
Gy = [-1,-2,-1;0,0,0;1,2,1];

% Upload an image
image = imread('house.jpg');
image = rgb2gray(image);
[row, col] = size(image);
threshold = 220;

% Mask size of Gx and Gy
[m, n] = size(Gx);
a = (m-1)/2;
b = (n-1)/2;

img = zeros(row+2*a ,col+2*b);
for r = 1:row
    for c = 1:col
        img(r+a, c+b) = image(r, c);
    end
end

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
        if f(r,c) > threshold
            f(r,c) = 255;
        else
            f(r,c) = 0;
        end
    end
end

% Applying Hough Transform
[yy, xx] = size(f);
thetas = atan(fy./ (fx+1*10^-6));
dist = round(sqrt(yy^2 + xx^2));
H = zeros(181, 2*dist);

for y=1:yy
    for x=1:xx
        theta = thetas(y,x);
        rho = round(x*cos(theta) + y*sin(theta)) + dist;
        th = round((theta + pi/2) / pi * 180) + 1;
        H(th, rho) = H(th, rho) + 1;
    end
end

output = image;
%output = (output*255)/(max(max(output)));
[rowH, colH] = size(H);
n = max(max(H));
% n = 1

for t = 1 : th 
    for p = 1 : rho 
       if (H(t, p) >= n)
           for c = 1:col
%                t = H(:, 1);
%                p = H(1,: );
               r = round((p - c*cos(t*pi/180))/(sin(t*pi/180)));
               if (r > row || r < 1)
                    continue
               end
               output(r, c) = 255;
           end
       end
    end
end

% Plotting Hough Transform
subplot(2,2,1), imagesc(image), title('Original Image'), colormap(gray);
subplot(2,2,2), imagesc(f), title('Sobel Image'), colormap(gray);
subplot(2,2,3), imagesc(imadjust(H)), title('Hough Transform'), colormap(gray);
subplot(2,2,4), imagesc(output), title('Image with edge'), colormap(gray);
