%% Nearest-Neighbor Interpolation
% Upload a picture and find its size
image = imread('woman.jpg');
image = rgb2gray(image);
[row, col] = size(image);  % size of rows and columns of image 
% Define the size of new image
s = 5;
nn_row = row * s;   % new column size
nn_col = col * s;   % new row size
nn_image = zeros(nn_row, nn_col); % dimensions of new image
nn_image = uint8(nn_image); 
for r = 1:row*s
    for c = 1:col*s
        % Scaling factor for output
        c_nn = ceil(c/s);
        r_nn = ceil(r/s);
        % Everything out of range
        if (c/s > 0 || c_nn == 0) && c_nn<col
            c_nn = c_nn+1;
        end
        if (r/s > 0 || r_nn == 0) && r_nn<row
            r_nn = r_nn+1;
        end
        nn_image(r, c) = image(r_nn, c_nn);
    end
end

%% Bilinear Interpolation
bi_row = s * row;
bi_col = s * col;
[col_f, row_f] = meshgrid(1 : bi_col, 1 : bi_row);
col_f = col_f / s;
row_f = row_f / s;
% Rounding values to the highest possible
c = floor(col_f);
r = floor(row_f);
% The difference between real reference to the rounded values
d_R = row_f - r;
d_C = col_f - c;
% The out ranges if pixels out of boundary
r(r < 1) = 1; c(c < 1) = 1;
r(r > row - 1) = row - 1;c(c > col - 1) = col - 1;
% Neighbor 4 pixels that surrounds major pixel
i1 = sub2ind([row, col], r, c);
i2 = sub2ind([row, col], r+1,c);
i3 = sub2ind([row, col], r, c+1);
i4 = sub2ind([row, col], r+1, c+1);
% Output image
bi_image = zeros(bi_row, bi_col); % Filling with zeros
bi_image = cast(bi_image, 'like', image); % Rounds the number to the nearest integer.
for i = 1 : size(image, 3)
    img = double(image(:,:,i)); 
    matrix = img(i1).*(1 - d_R).*(1 - d_C) + img(i2).*(d_R).*(1 - d_C) + img(i3).*(1 - d_R).*(d_C) + img(i4).*(d_R).*(d_C);
    bi_image(:,:,i) = cast(matrix,'like',image);
end

% %% Bicubic Interpolation
% bc_row = s * row;
% bc_col = s * col;
% [col_f, row_f] = meshgrid(1 : bi_col, 1 : bi_row);
% col_f = col_f / s;
% row_f = row_f / s;
% % Rounding values to the highest possible
% c = floor(col_f);
% r = floor(row_f);
% % The out ranges if pixels out of boundary
% for ri = 1:r
%     for ci = 1:c
%         if ri < 1 || ci < 1 || ri > row || ci > col
%             continue
%         end
%         % Neighbor 16 pixels that surrounds major pixel
%         in1 = sub2ind([row, col], ri-1, ci-1);
%         in2 = sub2ind([row, col], ri-1,ci);
%         in3 = sub2ind([row, col], ri-1, ci+1);
%         in4 = sub2ind([row, col], ri-1, ci+2);
%         in5 = sub2ind([row, col], ri, ci-1);
%         in6 = sub2ind([row, col], ri,ci);
%         in7 = sub2ind([row, col], ri, ci+1);
%         in8 = sub2ind([row, col], ri, ci+2); 
%         in9 = sub2ind([row, col], ri+1, ci-1);
%         in10 = sub2ind([row, col], ri+1,ci);
%         in11 = sub2ind([row, col], ri+1, ci+1);
%         in12 = sub2ind([row, col], ri+1, ci+2); 
%         in13 = sub2ind([row, col], ri+2, ci-1);
%         in14 = sub2ind([row, col], ri+2,ci);
%         in15 = sub2ind([row, col], ri+2, ci+1);
%         in16 = sub2ind([row, col], ri+2, ci+2); 
%     end
% end
% bc_image = zeros(bc_row, bc_col, size(image, 3));
% bc_image = cast(bc_image, 'like', image);
% for i = 1 : size(image, 3)
%     img = double(image(:,:,i)); 
%     bc_matrix = img(in1).*(0.2).*(0.2) + img(in2).*(0.2).*(0.2) + img(in3).*(0.2).*(0.2) + img(in4).*(0.2).*(0.2)+ ...
%         img(in5).*(0.4).*(0.6) + img(in6).*(0.6).*(0.4) + img(in7).*(0.4).*(0.6) + img(in8).*(0.4).*(0.6)+ ...
%         img(in9).*(0.6).*(0.6) + img(in10).*(0.6).*(0.4) + img(in11).*(0.4).*(0.6) + img(in12).*(0.4).*(0.6)+ ...
%         img(in13).*(0.2).*(0.2) + img(in14).*(0.2).*(0.2) + img(in15).*(0.2).*(0.2) + img(in16).*(0.2).*(0.2);
%     bc_image(:,:,i) = cast(bc_matrix,'like',image);
% end
%% Showing images with Nearest-Neighbor, Bilinear, and  Bicubic Interpolations
figure;
subplot(1,3,1); imagesc(image); colormap gray; title('Original');
subplot(1,3,2); imagesc(nn_image); colormap gray; title('Nearest Neighbor');
subplot(1,3,3); imagesc(bi_image);  colormap gray; title('Bilinear');
%subplot(1,4,4); imagesc(bc_image); colormap gray; title('Bicubic');