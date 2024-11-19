[I,path] = uigetfile('*.jpg','select a input image'); 
str = strcat(path,I);
s = imread(str);

% Otsu Binarization for segmentation
GlobalT = graythresh(s);


img = im2bw(s,.6);
img = bwareaopen(img,80); 
%img2 = im2bw(s);


subplot(1,2,1),imshow(s), title('Original Image');
subplot(1,2,2),imshow(img), title('Segmented Image');
