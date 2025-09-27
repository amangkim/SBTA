% sbta_mse_ms
% SPBC_Demo_004
% spbc_mse_ms
% rpcp_demo_008
% RPCP Reliability

%clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lambda = 2.5;
%a = 8;
%lambda = .6;
%a = 0.9;
%rho = 0.8;

%pb=0.9;
%M0=200;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M1=M0*pb;

p0 = 1/(1+lambda*a);
beta = (lambda*a)*p0;
Mb = M0*pb;
%Gam_M0 = beta^ceil(Mb/2)/(1-beta^(Mb+1));
%Gam_M0 =(1-beta.^ceil(Mb./2))./(1-beta.^(Mb+1));
Gam_M0 =(beta.^ceil(Mb/2)-beta.^(Mb+1))/(1-beta^(Mb+1));
M1 = [0:M0]';
GAME0 = Gam_M0;

%%%%%%%%%%%%%%%%%%%
m = [0:M0];
%pb=0.9;
PB= binopdf(m,M0,pb);
GAM2 = [];
for k=1:M0
    %m_ = k;
    bk = PB(k+1);
    %xi_m = beta^(k+1)/(lambda*a*(1-beta^(k+1)));    
    %gamma_m = beta^ceil(k/2+1)/(1-beta^(k+1));    
    %gamma_m = (1-beta^floor(k/2+1))/(1-beta^(k+1));    
    %gamma_m = beta^(k/2+1)/(1-beta^(k+1));    
    gamma_m = (beta^ceil(k/2)-beta^(k+1))/(1-beta^(k+1));    
    Gam_m = gamma_m*bk;    
    GAM2 = [GAM2 Gam_m];
end

%gam0 = beta/(1-beta)*PB(1);    
%gam0 = 1/(1-beta^(M0+1))*PB(1);    
%gam0 = (1-beta)/(1-beta^(M0+1))*PB(1);    
gam0 = PB(1);    
GAM2 = [gam0 GAM2];

%GAME0 = GAM2;
GAME=sum(GAM2,2);

%sum_pi1 = sum(PI1(1:ceil(M/2+1)));


sigma = sqrt((GAME0-GAME).^2);
sigma_r = sqrt((GAME0-GAME).^2)./GAME;
mse0 = mean(sigma);
mser = mean(sigma_r);

%figure
%hold on
%plot(m, PI10);
%plot(m, PI1E);
%hold off