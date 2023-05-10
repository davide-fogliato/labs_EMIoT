function [Icell] = cell_current(img)
    Vdd = 15;
    p1 = 4.251e-5;
    p2 = -3.029e-4;
    p3 = 3.024e-5;

    Icell = (double(img).*p1.*Vdd)./255 + (double(img).*p2)./255 + p3;
end