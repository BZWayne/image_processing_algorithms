# Image Processing Algorithms

## Nearest Neighbor Interpolation

The algorithm for Nearest Neighbor Interpolations works as follows:
1. Uploaded the image, converted from RGB to gray-scale, and computed the
output size of original image.
2. Since the size of image is given, I claimed the output size of image.
3. I used for loop for computing the rows and columns. Scaling factors are
calculated. Since pixels positions cannot be image(-1, -1) or bigger than output
size of image, I did not consider them; so just iterated until it reaches the last
column or row.
4. Since image is not integer, I have used uint8() function for conversion.
5. Then new image with iterated rows and columns are equal to interpolated
size of original image.

## Bilinear Interpolation
The algorithm for Bilinear Interpolations works as follows:
1. Uploaded the image, converted from RGB to gray-scale, and computed the
1
output size of original image.
2. Since the size of image is given, I claimed the output size of image.
3. I used for loop for computing the rows and columns. Scaling factors are
calculated. Since pixels positions cannot be row = -1, col = -1 or bigger than
output size of image, I did not consider them; so just iterated until it reaches
the last column or row.
4. I have used the meshgrid() in order to simplify my coding without using for
loops because positions for pixels already defined. sub2ind() function helped
me to vectoring the pixels in order to do the interpolation without creating for
loops, since it outputs a single linear index.
5. In order to get a single linear index from the row and column for further
calculation
6. Since the pixel value is weighted average of neighbors, I have computed the
distance between nearest neighbors. To reuse the algorithm, dene the data
types separately from the algorithm.
7. Then new image with iterated rows and columns are equal to interpolated
size of original image.
As we can see from picture below, Nearest Neighbor sharpened the picture due
to it just zoomed its size, however, bilinear smoothed the picture. The output
of both images looks as follows:

![alt text](https://github.com/BZWayne/image_processing_algorithms/blob/main/smoothing_algo/task1.jpg)

## Distance transform algorithm

The exercise required to implement a distance transform algorithm on blackwhite
image, black being foreground and white being background as follows, so
that the process looks as follows:
1. Uploaded the image, and converted to black-white image
2. Defined the values of new image, and found the max value in rows and
columns. This is used in order to conversion the highest value to 255 as the
task requires.
3. Used the for loop for iterating the pixels x = 1, 2, etc. There are 8 different
if-statements for borders of image in order to avoid out ranges. If row = 1 and
col = 1 the intensity of image is 0 and 4-adjacency pixels are 1 in the original
image, then the new image would take the value 1. 8 neighbor points get the
following values 2, 3, 4, etc. as the iteration continues.
4. Since the highest value of pixel is available, we have used the following to
normalize into 255. M = max(A,[],'all') function helped to find the highest
intensity among the pixels, and I converted into 0:255 scale. With a help of

floor() function, I rounded the 
oating value into integer value.
5. Plotted the original and output images, and their difference shown below:

![alt text](https://github.com/BZWayne/image_processing_algorithms/blob/main/distance_transform/task2.jpg)

## Masks (3x3) (5x5) (7x7)

The objective of the first task is to implement a filter that changes the intensity values of the
original image. The mask we apply is the size of NxN, where N is an odd number and flexible for
changes. The beginning of the mask starts with this mask:
```
$ mask = [1 2 3; 4 5 6; 7 8 10]
```
In order to change the values of the borders, an input image was produced with black borders.
The algorithm is as follows: first of all, the mask size was assigned as m and n . Since the mask
that we apply must not be fixed, mask size is as an example changed to 5x5 and 7x7:
```
$ [m, n] = size (mask);
$ a = (m-1)/2;
$ b = (n-1)/2;
```
In order to create an input image that contains an original image with black borders, the padding
has been used. The input image dimensions will be 2a and 2b bigger than original. The matrix img
is the input image with black borders, row and col are rows and columns of the original image:
```
$ img = zeros (row+2*a ,col+2*b);
$ for r = 1:row
$  for c = 1:col
$   img(r+a, c+b) = image(r, c);
$  end
$ end
```
Applying the mask to the input image provided the different intensity values for an output image.
However, the output image was too bright, so that normalization of output image helped me to
overcome this problem.

![alt text](https://github.com/BZWayne/image_processing_algorithms/blob/main/filtering_image/Screen%20Shot%202020-11-21%20at%2012.15.47.png)

## Sobel Operator

The objective of this task is to find the edges by applying the Sobel Operator to the original image.
In order to create the Sobel image, two masks were provided.
```
Gx = [-1,0,1;-2,0,2;-1,0,1];
Gy = [-1,-2,-1;0,0,0;1,2,1];
```
The algorithm for the Sobel image is the same as the first task. First of all, the original image
house.jpg is provided, the padding has been applied to the original image in order to ensure that
the dimensions of an output image is the same as an original image. Secondly, two different
masks Gx and Gy have been multiplied to input images, so that two different outputs for fx and fy .
In order to get the final output Sobel image f , the output image with Gx and the output image with
Gy by the following equation:
```
f = √fx2 + fy2
```
![alt text](https://github.com/BZWayne/image_processing_algorithms/blob/main/finding_edges/task2.jpg)

Adding some threshold, significantly changes the image:
Applying the thresholding to the output images changed the intensity values, so the visual
representation of the images. The threshold value is 150. If every pixel intensity is higher than this
value is assigned as 255, otherwise every pixel values are 0.
```
% Combined masks
f = sqrt ((fx).^2 + (fy).^2);
   for r = 1:row
     for c = 1:col
       if f(r,c) > thresh
         f(r,c) = 255;
       else
         f(r,c) = 0;
      end
   end
end
```
![alt text](https://github.com/BZWayne/image_processing_algorithms/blob/main/finding_edges/task2_with_thresh.jpg)

As we can observe two different final Sobel output images, their visual outputs do differ with
intensity values, so that Sobel image with thresholding was sharpened the edges rather than
without thresholding which looks smoother.

## Remove Noise

The objective of this task is to use a median filter to remove noise from the original image. As
input values video.mp4 and donald.jpg have been provided. In order to check the median filter
algorithm, I have used donald.jpg picture. Since this image without noise, the following line of
code has been used to provide a noise with 0.05 density.

```
% Upload an image and apply a noise to the image
image = imread( 'donald.jpg' );
image = rgb2gray(image);
image = imnoise(image, 'salt & pepper' ,0.05);
```

The new matrix has been assigned as pixel. In order to have the same size as an original image
the padding has been applied. In order to find the median value of a matrix, the matrix has been
changed to the array, and median found with the help of median() function

```
for r = 1:row
   for c = 1:col
      A = img(r:r+m-1, c:c+n-1);
      A = reshape (A. ',1,[]);
      pixel(r,c) = median(A);
   end
end
```
The matrix img is the input image with black borders, row and col are rows and columns of the
original image. The visual representation of the images shown below:

![alt_text](https://github.com/BZWayne/image_processing_algorithms/blob/main/remove_noise/Screen%20Shot%202020-11-21%20at%2012.26.41.png)

The same technique has been used to better the quality of the video provided. Each frame has
been taken with the help of video to frame conversion functions.
```
% Upload a video
video = VideoReader( 'video.mp4' );
get(video);
nFrames = video.NumberOfFrames;
col = video.Width;
row = video.Height;
```

Looping the frames, a median filter applied to each image frame, and saved 125 frames in the
folder with path. In order to convert the frames back to the video, image2video.m has been
implemented although with the help of video to frame conversion functions as VideoWriter()
function. The frame of the median filtered video is shown below 

[![Original Video](https://github.com/BZWayne/image_processing_algorithms/blob/main/remove_noise/video.mp4)]
[![Original Video](https://github.com/BZWayne/image_processing_algorithms/blob/main/remove_noise/filter_3x3.avi)]
[![Original Video](https://github.com/BZWayne/image_processing_algorithms/blob/main/remove_noise/filter_7x7.avi)]

The screens and difference of those filters shown below:

### Mask 3x3
![alt_text](https://github.com/BZWayne/image_processing_algorithms/blob/main/remove_noise/3x3.jpg)

As we can observe, 3x3 median filter is not an effective way to remove the noise. That is why the
region of median filtered matrix is flexible for any other odd numbers as shown in the previous
tasks. As an example, the dimensions of interest changed to 7x7 that removed the noise by
smoothing the image as shown.

### Mask 7x7
![alt_text](https://github.com/BZWayne/image_processing_algorithms/blob/main/remove_noise/7x7.jpg)

## Hough Transform

The objective of this task is to detect the lines using the modified Hough Transform algorithm. As
an original image house.jpg has been provided. Since the Sobel image, the Sobel image of y, and
the Sobel image of x are found in the second task, it was much convenient to find the gradient for
each pixel using Sobel edge detector. The range of 
```
Θ = [0 : 180]
```

and the range

```
ρ = [0 : 2 * distance]
% Combined masks
f = sqrt ((fx).^2 + (fy).^2);
% Applying Hough Transform
[yy, xx] = size (f);
thetas = atan (fy./ (fx+1*10^-6));
dist = round ( sqrt (yy^2 + xx^2));
H = zeros (181, 2*dist);
```

where fx and fy are Sobel images of x and y respectively, thetas is the gradient of each x and y ,
dist is the maximum distance, H is the hough space.
The algorithm that has been provided was implemented, and the output of the hough space is
shown below

![alt_text](https://github.com/BZWayne/image_processing_algorithms/blob/main/hough_transform/Hough_space.jpg)

The y-axis are the θ degrees and the x-axis are values ρ. From this hough
space, the greater number of votes must be extracted by using the following line of code.
```
n = max(max(H));
```
In order to draw lines in the original image following equation has been used:
```
y = (ρ − xcosθ)/sinθ
```
so that iterating via each θ , ρ , and x values, it can be possible to get an output value that shows
the position of the output matrix image where it must be white. Unfortunately, the following
algorithm lines drawn are too thin, and cannot be recognized by eyes. The visual representation of
the images looks as follows

![alt_text](https://github.com/BZWayne/image_processing_algorithms/blob/main/hough_transform/task4.jpg)
