% Upload a video 
video = VideoReader('video.mp4');
get(video);
nFrames = video.NumberOfFrames;
col = video.Width; 
row = video.Height;

% Region for median filtering 3x3
% It can be changed to any odd number as 7x7
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

for iFrame = 1:nFrames
    image = read(video,[iFrame]);
    image = rgb2gray(image);
    for r = 1:row-m+1
        for c = 1:col-n+1
            A = img(r:r+m-1, c:c+n-1);
            A = reshape(A.',1,[]);
            pixel(r+1,c+1) = median(A);
        end
    end
    file = sprintf('/Users/bzwayne/Desktop/Image Processing/Bauyrzhan_Zhakanov_HW2/Frames/frame_%04d.jpg', iFrame);
    imwrite(pixel, file);
end
