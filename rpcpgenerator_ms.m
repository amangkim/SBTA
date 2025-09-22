% RPCP (Reverse Poison Counting Process Generator
% Generting the probability distribution of RPCP.
% Made by Amang Kim

%%%%%%%%%%%%%%%%%
Q = [0:M];
P = [p0];

PI1 = [];
A = 0;
sum_pi1 = 0;

for k =1:M  
    pk_ = p0*beta^(k);
    pi0_ = pk_;
    pi1_ = p0*beta^(M-k);
    
    P = [P pk_];
    PI1=[PI1 pi1_];
            
end

PM = sum(P);

p_loss = 1-PM;
A = 1-p_loss;
PI0 = P/A;
PI1 = PI1/A;
pi1_0 = 1-sum(PI1);

PI1 =[pi1_0 PI1];


%%%%%%%%%%%%%%%%%