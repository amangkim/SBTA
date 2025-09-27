% SBTA_Demo_200
% E(G(X)) vs. G((E(X)) --- Case #2
% RPCP Reliability

clear all
lambda = 4.8;
a = 1.5;
rho = 0.7;


p_min = .3;
PP = [p_min:.01:1]';

MM = [80:10:150];
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



%%%%%%%%%%%%
AA=max(MSE2D);
[min_max i_str_d]= min(AA);
[max_max i_str_u]= max(AA);

%m_edg_idx = [i_str_d i_str_u];

PB_len = length(PP);

MSE_up = MSE2D(:,i_str_u);
MSE_dn = MSE2D(:,i_str_d);

%[min_max i_str_u]= mean(MSE_up);
%[max_max i_str_d]= mean(MSE_dn);


u_lim = mean(MSE_up);
d_lim = mean(MSE_dn);

%u_lim = max(MSE_up);
%d_lim = max(MSE_dn);
g_lim = 0.1;

ProLine_u = u_lim*ones(1,PB_len);
ProLine_d =d_lim*ones(1,PB_len);
ProLine_g =g_lim*ones(1,PB_len);

%j_str_u = min(find(abs(MSE_up-u_lim)<=0.005));
%j_str_d = min(find(abs(MSE_up-d_lim)<=0.005));

j_str_u = find(abs(PP-0.87)<=0.005);
j_str_d = find(abs(PP-0.73)<=0.005);

%i_str_g = min(find(abs(PP-0.68)<=g_lim));


pp_up = PP(j_str_u);
pp_dn = PP(j_str_d);


%lgnd_1 = ['Max MSER (= ' num2str(u_lim,'%.2f') ') for 10% @ ['  num2str(MM(i_str_u)) ',' num2str(PP(j_str_u),'%.2f')  ']'];
%lgnd_2 = ['min MSER (= ' num2str(d_lim,'%.2f') ') for 10% @ ['  num2str(MM(i_str_d)) ',' num2str(PP(j_str_d),'%.2f')  ']'];
%lgnd_1 = ['Max MSER for 10% @ ['  num2str(MM(i_str_u)) ', ' num2str(PP(j_str_u),'%.2f')  ']'];
%lgnd_2 = ['min MSER for 10% @ ['  num2str(MM(i_str_d)) ', ' num2str(PP(j_str_d),'%.2f')  ']'];

lgnd_1 = ['10% Max MSER @ [' num2str(MM(i_str_u)) ' nodes, p_{m} >= '  num2str(PP(j_str_u),'%.2f') ']'];
lgnd_2 = ['10% min MSER @ [' num2str(MM(i_str_d)) ' nodes, p_{m} >= '  num2str(PP(j_str_d),'%.2f') ']'];


%lgnd_2 = ['Min MSER (= ' num2str(d_lim*100,'%.1f') '% @ ' num2str(MM(i_str_d)) ' nodes)'];
%lgnd_1 = ['Max MSER (= ' num2str(u_lim,'%.2f') ' @ ' num2str(MM(i_str_u)) ' nodes)'];
%lgnd_2 = ['Min MSER (= ' num2str(d_lim,'%.2f') ' @ ' num2str(MM(i_str_d)) ' nodes)'];


%lgnd_1 = ['5% Error rate @ [p_{m} = ' num2str(PP(j_str_u),'%.2f') ']'];
%lgnd_2 = ['10% Error rate @ [p_{m} = ' num2str(PP(j_str_d),'%.2f') ']'];

lgnd_3 = ['Upper error rate @ [p_{m} = ' num2str(PP(j_str_u),'%.2f') ']'];
lgnd_4 = ['Lower error rate @ [p_{m} = ' num2str(PP(j_str_d),'%.2f') ']'];


%%%%%%%%%%%%
%lgnd_1 = ['Max MSER (= ' num2str(u_lim*100,'%.1f') '% @ ' num2str(MM(i_str_u)) ' nodes)'];
%lgnd_2 = ['Min MSER (= ' num2str(d_lim*100,'%.1f') '% @ ' num2str(MM(i_str_d)) ' nodes)'];
%lgnd_3 = ['Accountability of each node ( p_{m} = ' num2str(PP(i_str_g)) ' )'];

%lgnd_1 = [num2str(MM(1)) ' nodes'];
%lgnd_2 = [num2str(MM(20)) ' nodes'];
%lgnd_2 = [num2str(MM(20)) ' nodes'];

%lgnd_2 = ['Accountability of each node ( p_{m} = ' num2str(PB(i_str)) ' )'];
%lgnd_2 = ['Half of nodes (M/2) = ' num2str(M0(idx_M2))];
%lgnd_3 = ['Availability theshold (@ rho = ' num2str( rho*100, '%.0f') '%)'];
%lgnd_3 = ['Availability theshold ( @ rho = ' num2str( rho, '%.2f') ' )'];
%lgnd_1 = ['Optimal BC Nodes (@ rho = ' num2str(rho) ') = ' num2str(M0(i_str))];
%lgnd_1 = ['5% Error rate @ [p_{m} = ' num2str(PP(i_str_u),'%.2f') ']'];
%lgnd_2 = ['1% Error rate @ [p_{m} = ' num2str(PP(i_str_d),'%.2f') ']'];

%xlb = ['Accountability of each node (p_{m})'];
xlb = ['Accountability of each node (p_{m}), M = [' num2str(min(MM)) ', ' num2str(max(MM)) ']'];
%xlb = ['Node accountability (M_{max} = ' num2str(M0) ' nodes)'];
ylb = ['Mean square error rate (MSER)']; % (@rho = ' num2str( rho*100, '%.0f') '%)'];
%tle = ['Secure network design (total ' num2str(M0) ' nodes)'];
%tle = ['MSE Analysis (between ' num2str(min(MM)) ' and ' num2str(max(MM)) ' nodes)'];
%tle = ['MSE between E[G(X)] and G(E[X]), M=[10,200]'];
tle = ['MSER between E[G(X)] and G(E[X])'];

figure
ax = gca;
ax.XLim = [p_min 1];
%ax.YLim = [0 .02];
xlabel(xlb);
ylabel(ylb);
%title(tle);
hold on
grid on 
%plot(PP(j_str_u),ProLine_u(j_str_u),'bs','MarkerSize',10,'MarkerFaceColor','b');
%plot(PP(j_str_d),ProLine_d(j_str_d),'rs','MarkerSize',10,'MarkerFaceColor','r');

plot(PP(j_str_u),ProLine_g(j_str_u),'bs','MarkerSize',10,'MarkerFaceColor','b');
plot(PP(j_str_d),ProLine_g(j_str_d),'rs','MarkerSize',10,'MarkerFaceColor','r');


%plot(PP,MSE2D(:,[i_str_u i_str_d]))
plot(PP,MSE_up);
plot(PP,MSE_dn);
%plot(PP,MSE2D)

%plot(PP,ProLine_u,'b.','LineWidth',5);
%plot(PP,ProLine_d,'r.','LineWidth',5);
plot(PP,ProLine_g,'m.','LineWidth',5);



%plot(PP,MSE2D)


%plot(PP(i_str_u),ProLine_u(i_str_u),'rs','MarkerSize',10,'MarkerFaceColor','r');
%plot(PP(i_str_d),ProLine_d(i_str_d),'bs','MarkerSize',10,'MarkerFaceColor','b');
%legend(lgnd_1, lgnd_2, lgnd_3,'location', 'northeast');
legend(lgnd_1, lgnd_2,'location', 'northeast');
%legend(lgnd_1,lgnd_2, lgnd_3,'location', 'northeast','Orientation','horizontal');