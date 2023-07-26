close all;
clear all;

 gray = imread('D:\semester_2\wavelet_2d\lena.jpg');
 imshow(gray)
 input_2d = gray(:,:,1);

fid = fopen('C:\Users\chand\Downloads\new_dwt.hex');
% A   = fread(fid);
A = textscan(fid,'%s')
fclose(fid);

a1 = A(1);
b = a1{1,1};
 c(:,1) = hex2dec(b(:,1))

d = uint8(c(:,1));
for k = 1:1:64
    for j = 1:1:250
        data(k,j) = uint8(c(((k-1)*256)+j,1));
        
    end
end

%gray_reconstructed(:,:,1) = data;
%gray_reconstructed(:,:,2) = data;
%gray_reconstructed(:,:,3) = data;

figure;
imshow(data);
title('Compressed image Output from verilog');

%order = 5;
%input_image = imread('C:\Users\saisrikar\Desktop\seminar\Rank_Order_Filter_08052022\Rank_Order_Filter\Project Files\image_gray_scale_noise_added_128x128.jpg');
%[ylength,xlength] = size(input_image); % determines size of input image
%output_image(1:ylength,1:xlength) = zeros; %inits output_image
% loops to simulate SE window passing over image
%for y=1:ylength-2
%for x=1:xlength-2
%window = [input_image(y:(y+2),x:(x+2))];
%window_v = [[window(1,1:3)] [window(2,1:3)] [window(3,1:3)]];
%sorted_list = sort(window_v);
%output_image(y+1,x+1) = sorted_list(order);
%sorted_list(order);
%end
%end
%plots ro filtered image
%gray_reconstructed2 = output_image(1:128,1:128);%/3;

%figure;
%colormap(gray(256));
%image(gray_reconstructed2);
%title('Rank Order Filter Output from matlab');






