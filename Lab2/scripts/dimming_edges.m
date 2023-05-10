% Get list of all tiff files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
imagefiles = dir('../images/4.1.04.tiff');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name
   currentimage = imread(strcat('../images/', currentfilename));
   I{ii} = currentimage;

    threshold = [0,5,10,20,50,100,150,200,500];
    distance = zeros(size(I{ii}));
    for k = 1:length(threshold)
        Imod{ii} = I{ii};
        for i = 1:height(I{ii})
            for j = 1:width(I{ii})
                distance(i,j) = sqrt((i-1-height(I{ii})/2)^2 + (j-1-width(I{ii})/2)^2);
                if distance(i,j) > threshold(k)
                     Imod{ii}(i,j,:) = I{ii}(i,j,:) - (distance(i,j) - threshold(k))./distance(1,1).*I{ii}(i,j,:);
                end
            end
        end
        Psaved(ii,k)=power_saved(I{ii},Imod{ii});
        Dist(ii,k)=distortion(I{ii},Imod{ii});
        imshow(Imod{ii})
    end

    figure
    x_value = Dist(ii,9):Dist(ii,1)/100:Dist(ii,1);
    y_value = interp1(unique(Dist(ii,:)),unique(Psaved(ii,:)),unique(x_value));
    plot(Dist(ii,:),Psaved(ii,:),'o',x_value,y_value)
    xlabel('Distortion [%]')
    ylabel('Power saved  [%]')
    title(currentfilename);
    grid on
    
end

avgP = sum(Psaved,'all')/(width(Psaved)*height(Psaved))
avgDsum = sum(Dist,'all')/(width(Dist)*height(Dist))

