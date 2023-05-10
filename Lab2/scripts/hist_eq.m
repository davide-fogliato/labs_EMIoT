% Get list of all tiff files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
imagefiles = dir('../images/vscode.tiff');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(strcat('../images/', currentfilename));
   I{ii} = currentimage;

   Imod{ii}=rgb2hsv(I{ii});
   target = zeros(1,255);
   target(1,1) = 1;
   target(1,10) = 1;
   Imod{ii} = histeq(Imod{ii},target);

   ImodRGB{ii}=uint8(hsv2rgb(Imod{ii})*255);



   imhist(ImodRGB{ii})
   Psaved=power_saved(I{ii},ImodRGB{ii})
   Dist=distortion(I{ii},ImodRGB{ii})
end