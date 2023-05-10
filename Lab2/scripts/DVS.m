clear

SATURATED = 1;
DISTORTED = 2;
Vdd_org=15;

imagefiles = dir('../images/*.tiff');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
    currentfilename = imagefiles(ii).name
    currentimage = imread(strcat('../images/', currentfilename));
    I = currentimage;
    Icell_org = cell_current(I);
    %Scaled supply voltage
    for i=0:3
        Vdd = 15-i;

        %without compensation
        I_sat = uint8(displayed_image(Icell_org, Vdd, SATURATED));
        Ihsv=rgb2hsv(I); Ihsv_sat=rgb2hsv(I_sat); 
        Icell_sat = cell_current(I_sat);
        P_sat(ii,i+1)=panel_power(Icell_org,Icell_sat);
        d_sat(ii,i+1)=distortion(I,I_sat);

        %with compenation
        if (i==0)
            P_sat_comp(1,1)=0;
            d_sat_comp(1,1)=0;
        else
            I_compensated=rgb2hsv(I);
            I_compensated(:,:,3)=I_compensated(:,:,3)+0.01*(Vdd_org-Vdd);
            I_compensated(:,:,2)=I_compensated(:,:,2)+0.05*(Vdd_org-Vdd);
            %to increase the contrast
            v=I_compensated(:,:,3);
            v(find(v < 0.3)) = 0;
            v(find(v > 0.7)) = 0.7;
            I_compensated(:,:,3)=v;
            I_comp=uint8(hsv2rgb(I_compensated)*255);
            Icell_comp = cell_current(I_comp);
            I_sat_comp = uint8(displayed_image(Icell_comp, Vdd, SATURATED));
            Icell_sat_comp = cell_current(I_sat_comp);
            P_sat_comp(ii,i+1)=panel_power(Icell_org,Icell_sat_comp);
            d_sat_comp(ii,i+1)=distortion(I,I_sat_comp);
            if (i==3)
                figure
                subplot(2,2,1)           % display original image
                image(I); 
                subplot(2,2,2)
                image(I_sat);            % display saturated RGB image without compensation
                subplot(2,2,3);
                image(I_sat_comp);       % display saturated RGB image with compensation
            end
        end
    end
    figure
    x_value = 0:d_sat(ii,i+1)/100:d_sat(ii,i+1);
    y_value = interp1(unique(d_sat(ii,:)),unique(P_sat(ii,:)),unique(x_value));
    plot(d_sat(ii,:),P_sat(ii,:),'o')
    hold on
    plot(x_value,y_value,'DisplayName','Without compensation')
    x_value_comp = 0:d_sat_comp(ii,i+1)/100:d_sat_comp(ii,i+1);
    y_value_comp = interp1(unique(d_sat_comp(ii,:)),unique(P_sat_comp(ii,:)),unique(x_value_comp));
    plot(d_sat_comp(ii,:),P_sat_comp(ii,:),'o')
    plot(x_value_comp,y_value_comp,'DisplayName','With compensation')
    xlabel('Distortion [%]')
    ylabel('Power saved  [%]') 
    grid on
    hold off
end

avgP = sum(P_sat,'all')/(width(P_sat)*height(P_sat))
avgD = sum(d_sat,'all')/(width(d_sat)*height(d_sat))
avgP_comp = sum(P_sat_comp,'all')/(width(P_sat_comp)*height(P_sat_comp))
avgD_comp = sum(d_sat_comp,'all')/(width(d_sat_comp)*height(d_sat_comp))
