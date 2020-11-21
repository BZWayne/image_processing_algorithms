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
The difficulty I faced during the process were a conversion from 
oating to
integer value, implementing the out ranges of image so that it would neglect
them.

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
The diculty I faced during the process were calculating the weighted average
since it took too much time for understanding, implementing the out ranges
of image so that it would neglect them. The good thing I have recognized is
exploring new functions as meshgrid() and sub2ind() that simplied the whole
process.
As we can see from Figure 1., Nearest Neighbor sharpened the picture due
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
