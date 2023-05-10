function [Psav] = power_saved(img1,img2)
    Psav = ((est_pow_cons_img(img1)-est_pow_cons_img(img2))/est_pow_cons_img(img1))*100;
end