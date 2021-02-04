clc
close all
clear all
im = imread('./man.bmp');
Iycbcr = rgb2ycbcr(im);
im = Iycbcr(:,:,1);
im = im2double(im);
[U,S,V] = svd(im);
D = diag(S);
%更改i值以选择保留的特征个数
i = 100;
I = U(:,:)*S(:,1:i)*V(:,1:i)';
psnr = compute_psnr(im,I);
disp(psnr)
%imshow(I)
imwrite(I, ['./save/SVD_i=' num2str(i) '.bmp']);
