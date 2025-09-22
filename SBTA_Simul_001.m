% SBTA_Simul_001 (Figure 1)
% Visulization of Secured PBC Reliability (Availability)
% Made by Amang Kim


clear all
lambda = 4.8;
a = 1.5;
%lambda = .6;
%a = 0.9;
rho = 0.9;


M_max = 50;
P =[];
p0 = 1/(1+lambda*a);
beta = (lambda*a)*p0;
P = [p0];

%M = 50;
M0 = [1:M_max];
Rel = [];

for i=1:M_max
    M = M0(i);
    P =[];
    p0 = 1/(1+lambda*a);
    beta = (lambda*a)*p0;
    P = [p0];
    %%%%%%%%%%%%%%%%%%%%
    rpcpgenerator_ms
    %%%%%%%%%%%%%%%%%%%%
    
    sum_pi1 = sum(PI1(1:ceil(M/2+1)));
    rel = max(0,1-sum_pi1);
    
    Rel = [Rel rel];    

end

i_s = find(Rel>=rho);
i_str = min(i_s);
%i_str = max(i_s);
M_str = M0(i_str)

idx_M2 = find(M0==ceil(M_max/2));

RelLine = rho*ones(1,M_max);

%lgnd_1 = ['Number of blockchain nodes'];
lgnd_1 = ['SBTA Reliability'];
%lgnd_2 = ['Half of nodes (M/2) = ' num2str(M0(idx_M2))];
lgnd_2 = ['Reliability of half nodes (M/2 = ' num2str(M0(idx_M2)) ') = ' num2str(Rel(idx_M2)*100,'%.0f') '%'];
%lgnd_2 = ['Reliability = ' num2str(Rel(idx_M2),'%.2f')];
lgnd_3 = ['Blockchain availability theshold (@ rho = ' num2str(rho) ')'];
%lgnd_4 = ['Optimal BC Nodes (@ rho = ' num2str(rho) ') = ' num2str(M0(i_str))];
lgnd_4 = ['Optimal BC Nodes = ' num2str(M0(i_str))];
xlb = ['Number of blockchain nodes'];
ylb = ['Network availability'];
tle = ['Secured blockchain network node availability'];

figure
ax = gca;
ax.XLim = [1 M_max];
xlabel(xlb);
ylabel(ylb);
%title(tle);

hold on
grid on
bar(M0, Rel, 'edgecolor','none','facecolor','c');
bar(M0(idx_M2), Rel(idx_M2), 'edgecolor','none','facecolor','b');
plot(M0,RelLine,'m','LineWidth',2);
plot(M0(i_str),Rel(i_str)+0.04,'rv','MarkerSize',8,'MarkerFaceColor','r');
legend(lgnd_1,lgnd_2,lgnd_3,lgnd_4, 'location', 'southeast');

hold off