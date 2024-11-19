[I,path] = uigetfile('*.jpg','select a input image'); 
str=strcat(path,I);
im =imread(str);

bw = im2bw(im,0.7);
label = bwlabel(bw);
stats = regionprops(label,'Solidity','Area');
density =[stats.Solidity];
area=[stats.Area];

high_dense_area=density>0.5;
max_area = max(area(high_dense_area));
tumor_label=find(area==max_area);

tumor=ismember(label,tumor_label);
se=strel('square',5);
tumor=imdilate(tumor,se);
imshow(im,[]);
[B,L]=bwboundaries(tumor,'noholes');
imshow(im,[]);
hold on
for i=1:length(B)
    plot(B{i}(:,2),B{i}(:,1), 'y' ,'linewidth',3.45);
end

hold off