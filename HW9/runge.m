f = @(u) 1/(1-2*u+2*u.^2);
conve = pi/2;
I = compGaussQuad(f,0,1,4,5);
abs(conve - I) <= 1e-8