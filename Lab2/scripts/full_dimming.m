I = imread('../images/house.tiff');

I1 = I;
pecrentage = 84;
I1 = (pecrentage/100)*I1;

imshow(I1)

Psaved(1)=power_saved(I,I1)
Dist(1)=distortion(I,I1)
