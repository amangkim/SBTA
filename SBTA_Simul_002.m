% SBTA_Simul_002 (Figure 2)
% E(G(X)) vs. G((E(X)) --- Case #2
% RPCP Reliability
% Made by Amang Kim

clear all
lambda = 4.8;
a = 1.5;
rho = 0.7;


p_min = .3;
PP = [p_min:.01:1]';

MM = [10:10:150];
%MM = [50:10:160];

MSE2D = [];
for ii=1:length(MM)
    MSER0 = [];
    mser0 =0;
    for jj =1:length(PP)
        M0 = MM(ii);    
        pb = PP(jj);    
        sbta_mse_ms;
        mser0 = mser;
        MSER0 = [MSER0; mser0];      
    end
    MSE2D = [MSE2D MSER0];
end


PB_len = length(PP);




AA=max(MSE2D);
[min_max i_str_d]= min(AA);
[max_max i_str_u]= max(AA);

PB_len = length(PP);

MSE_up = MSE2D(:,i_str_u);
MSE_dn = MSE2D(:,i_str_d);



u_lim = mean(MSE_up);
d_lim = mean(MSE_dn);

g_lim = 0.1;

ProLine_u = u_lim*ones(1,PB_len);
ProLine_d =d_lim*ones(1,PB_len);
ProLine_g =g_lim*ones(1,PB_len);


j_str_u = find(abs(PP-0.87)<=0.005);
j_str_d = find(abs(PP-0.73)<=0.005);




pp_up = PP(j_str_u);
pp_dn = PP(j_str_d);

lgnd_1 = ['10% Max MSER @ [' num2str(MM(i_str_u)) ' nodes, p_{m} >= '  num2str(PP(j_str_u),'%.2f') ']'];
lgnd_2 = ['10% min MSER @ [' num2str(MM(i_str_d)) ' nodes, p_{m} >= '  num2str(PP(j_str_d),'%.2f') ']'];


lgnd_3 = ['Upper error rate @ [p_{m} = ' num2str(PP(j_str_u),'%.2f') ']'];
lgnd_4 = ['Lower error rate @ [p_{m} = ' num2str(PP(j_str_d),'%.2f') ']'];


%%%%%%%%%%%%
xlb = ['Accountability of each node (p_{m}), M = [' num2str(min(MM)) ', ' num2str(max(MM)) ']'];
ylb = ['Mean square error rate (MSER)']; % (@rho = ' num2str( rho*100, '%.0f') '%)'];
tle = ['MSER between E[G(X)] and G(E[X])'];

figure
ax = gca;
ax.XLim = [p_min 1];

xlabel(xlb);
ylabel(ylb);
title(tle);

hold on
grid on 

plot(PP(j_str_u),ProLine_g(j_str_u),'bs','MarkerSize',10,'MarkerFaceColor','b');
plot(PP(j_str_d),ProLine_g(j_str_d),'rs','MarkerSize',10,'MarkerFaceColor','r');

plot(PP,MSE_up);
plot(PP,MSE_dn);

plot(PP,ProLine_g,'m.','LineWidth',5);
hold of

