clear all
close all
clc

no_copy = 0;

img = imread('lena.jpg');
figure
imshow (img)
drawnow

info_0 = imfinfo('lena.jpg');
info_1 = struct2cell(info_0);

listing_0 = dir('E:\Upwork');
listing_1 = struct2cell(listing_0);

s1 = info_1(2);
for i=1:length(listing_0)
    s2 = listing_1(3,i);
    t = strcmp(s1,s2);
    if t==1
        copy = listing_1(:,i);
        no_copy = no_copy+1;
    end
end

