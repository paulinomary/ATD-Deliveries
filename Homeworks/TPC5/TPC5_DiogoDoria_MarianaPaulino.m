%% 1

t = 0:1/10000:2;
tiledlayout(3,1)

% Alfa -> Valor entre 8 e 15
alfaf0 = 2;
alfaw0 = 2 * pi * alfaf0;
alfax = 0.75 * cos(6 * alfaw0 * t + 95) + 1.15 * cos(7 * alfaw0 * t + 88);
nexttile 
plot(t, alfax)
title('Alpha')

% Beta -> Valor entre 16 e 31
betaf0 = 3;
betaw0 = 2 * pi * betaf0;
betax = 1.2 * cos(9 * betaw0 * t + 4) + 0.8 * cos(8 * betaw0 * t + 121) + 0.95 * cos(6 * betaw0 * t + 25);
nexttile
plot(t, betax)
title('Beta')

% Gamma -> Valor entre 30 e 100
gammaf0 = 10;
gammaw0 = 2 * pi * gammaf0;
gammax = 2 * cos(7 * gammaf0 * t + 33) + 1.55 * cos(9 * gammaw0 * t + 51) + 0.50 * cos(8 * gammaw0 * t + 77) + 0.9 * cos(10 * gammaw0 * t + 30);
nexttile
plot(t, gammax)
title('Gamma')

%% 2

figure

alfaT = 1/alfaf0;
betaT = 1/betaf0;
gammaT = 1/gammaf0;

talpha = 0:alfaT;
tbeta = 0:betaT;
tgamma = 0:gammaT;

kMaxalfa = 15;
kMaxbeta = 31;
kMaxgamma = 100;

Xalfa = zeros(1,2*kMaxalfa+1);
Xbeta = zeros(1,2*kMaxbeta+1);
Xgamma = zeros(1,2*kMaxgamma+1);

tiledlayout(3,1)

for k = 8:kMaxalfa
    transfa = alfax.*exp(-1j*k*alfaw0*t);
    Xalfa(k+kMaxalfa+1) = (1/alfaT)*trapz(t,transfa);
end
nexttile
stem(abs(-kMaxalfa:kMaxalfa)*alfaw0, real(Xalfa))

for k = 16:kMaxbeta
    transfb = betax.*exp(-1j*k*betaw0*t);
    Xbeta(k+kMaxbeta+1) = (1/betaT)*trapz(t,transfb);
end
nexttile
stem(abs(-kMaxbeta:kMaxbeta)*betaw0, real(Xbeta))

for k = 30:kMaxgamma
    transfg = gammax.*exp(-1j*k*gammaw0*t);
    Xgamma(k+kMaxgamma+1) = (1/gammaT)*trapz(t,transfg);
end
nexttile
stem(abs(-kMaxgamma:kMaxgamma)*gammaw0, real(Xgamma))