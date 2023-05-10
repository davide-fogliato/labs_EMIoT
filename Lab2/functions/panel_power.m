function [Ppanel] = panel_power(Icell,Icell_saturated)
    Vdd = 15;

    Ppanel_original = sum(Icell,'all').*double(Vdd);
    Ppanel_saturated = sum(Icell_saturated,'all').*double(Vdd);
    Ppanel= ((Ppanel_original-Ppanel_saturated)/(Ppanel_original))*100;
end