function [Pimg] = est_pow_cons_img(img)
    y = 0.7755;
    wo = 1.48169521e-6;
    wr = 2.13636845e-7;
    wg = 1.77746705e-7;
    wb = 2.14348309e-7;
    [R,G,B] = imsplit(img);

    Pimg = wo + sum(wr.*double(R).^double(y), 'all') + sum(wg.*double(G).^double(y), 'all') + sum(wb.*double(B).^double(y), 'all');
end