% Get list of all tiff files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
imagefiles = dir('../images/*.tiff');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name
   currentimage = imread(strcat('../images/', currentfilename));
   I{ii} = currentimage;

    %HUNGRY BLUE
    I1=I{ii};
    I2=I{ii};
    I3=I{ii};
    I4=I{ii};
    I5=I{ii};
    I6=I{ii};
    I7=I{ii};
    I8=I{ii};
    I9=I{ii};
    I1(:,:,3)=I{ii}(:,:,3)-5;
    Psaved(ii,1)=power_saved(I{ii},I1);
    Dist(ii,1)=distortion(I{ii},I1);
    I2(:,:,3)=I{ii}(:,:,3)-10;
    Psaved(ii,2)=power_saved(I{ii},I2);
    Dist(ii,2)=distortion(I{ii},I2);
    I3(:,:,3)=I{ii}(:,:,3)-20;
    Psaved(ii,3)=power_saved(I{ii},I3);
    Dist(ii,3)=distortion(I{ii},I3);
    I4(:,:,3)=I{ii}(:,:,3)-40;
    Psaved(ii,4)=power_saved(I{ii},I4);
    Dist(ii,4)=distortion(I{ii},I4);
    I5(:,:,3)=I{ii}(:,:,3)-50;
    Psaved(ii,5)=power_saved(I{ii},I5);
    Dist(ii,5)=distortion(I{ii},I5);
    I6(:,:,3)=I{ii}(:,:,3)-100;
    Psaved(ii,6)=power_saved(I{ii},I6);
    Dist(ii,6)=distortion(I{ii},I6);
    I7(:,:,3)=I{ii}(:,:,3)-150;
    Psaved(ii,7)=power_saved(I{ii},I7);
    Dist(ii,7)=distortion(I{ii},I7);
    I8(:,:,3)=I{ii}(:,:,3)-200;
    Psaved(ii,8)=power_saved(I{ii},I8);
    Dist(ii,8)=distortion(I{ii},I8);
    I9(:,:,3)=I{ii}(:,:,3)-255;
    Psaved(ii,9)=power_saved(I{ii},I9);
    Dist(ii,9)=distortion(I{ii},I9);

    figure
    x_value = Dist(ii,1):Dist(ii,9)/100:Dist(ii,9);
    y_value = interp1(unique(Dist(ii,:)),unique(Psaved(ii,:)),unique(x_value));
    plot(Dist(ii,:),Psaved(ii,:),'o',x_value,y_value)
    xlabel('Distortion [%]')
    ylabel('Power saved  [%]')
    title(currentfilename);
    grid on

        
end

avgP = sum(Psaved,'all')/(width(Psaved)*height(Psaved))
avgDsum = sum(Dist,'all')/(width(Dist)*height(Dist))


