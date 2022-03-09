%% Fundamentals of GPS - HW 3 - Problem 4

clear
clc
close all

%% Part A

svPos = [0 300;
        100 400;
        700 400;
        800 300];

base = [400 0];

user = [401 0];

rho_user = sqrt( (svPos(:,1) - user(1)).^2 +  (svPos(:,2) - user(2)).^2 ) + randn;
rho_base = sqrt( (svPos(:,1) - base(1)).^2 +  (svPos(:,2) - base(2)).^2 ) + randn;

estPos = [0; 0];
rcvrSigma = 0.5;

figure
plot(svPos(:,1), svPos(:,2), '*')
hold on
plot(base(1), base(2), '*')
plot(user(1), user(2), 'g*')
legend('SVs','Base Station','User','Location','southeast')
axis padded
grid on

est2SV = gnssPositionPC(rho_user(1:2,:)', svPos(1:2,:)', estPos, rcvrSigma);
est4SV = gnssPositionPC(rho_user', svPos', estPos, rcvrSigma);

est2SV.PDOP = sqrt( est2SV.DOP(1,1)^2 + est2SV.DOP(2,2)^2 );
est4SV.PDOP = sqrt( est4SV.DOP(1,1)^2 + est4SV.DOP(2,2)^2 );