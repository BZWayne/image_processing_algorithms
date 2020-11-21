d = '/Users/bzwayne/Desktop/Image Processing/Bauyrzhan_Zhakanov_HW2/Frames';

imageNames = dir(fullfile(d, '/*.jpg'));
imageNames = {imageNames.name}';

video = VideoWriter(fullfile(d,'filter_3x3.avi'));
open(video)
for i = 1:length(imageNames)
    image = imread(fullfile(d,imageNames{i}));
    writeVideo(video,image)
end
close(video)
