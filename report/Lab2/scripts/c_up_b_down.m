% Get list of all tiff files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
imagefiles = dir('../images/*.tiff');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name
   currentimage = imread(strcat('../images/', currentfilename));
   I{ii} = currentimage;

    Imod{ii}=rgb2hsv(I{ii});
    
    for i = 1 : height(I{ii})
        for j = 1 : width(I{ii})
            Imod{ii}(i,j,2) = 1.5*Imod{ii}(i,j,2);
            if Imod{ii}(i,j,3) >= 0.7
                Imod{ii}(i,j,3) = 0.7;
            elseif Imod{ii}(i,j,3) <= 0.3
                Imod{ii}(i,j,3) = 0;
            end
        end
    end
    
    Imod{ii}=uint8(hsv2rgb(Imod{ii})*255);
    
    Psaved(ii)=power_saved(I{ii},Imod{ii});
    Dist(ii)=distortion(I{ii},Imod{ii});
    imshow(Imod{ii})
end

avgP = sum(Psaved,'all')/(width(Psaved)*height(Psaved))
avgDsum = sum(Dist,'all')/(width(Dist)*height(Dist))

imwrite (Imod{ii}, '../mod_images/4.2.02cb.tiff');

