function [Diff_img] = distortion(img1, img2)
    lab1 = rgb2lab(img1);
    L1 = lab1(:,:,1);
    a1 = lab1(:,:,2);
    b1 = lab1(:,:,3);
    lab2 = rgb2lab(img2);
    L2 = lab2(:,:,1);
    a2 = lab2(:,:,2);
    b2 = lab2(:,:,3);
    Diff_img = (sum(sqrt(((L1-L2).^2)+((a1-a2).^2)+((b1-b2).^2)), 'all')/(width(img1)*height(img1)*sqrt(100^2+255^2+255^2)))*100;
end