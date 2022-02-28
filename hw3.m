%% Fundamentals of GPS - Homework 3 - Tanner Koza

clear
clc
close all

%% Problem 1

% Part A
numMeas = 1;
numSims = 1000;

var_a = 10;
var_b = 25;

sigma_a = sqrt(var_a);
sigma_b = sqrt(var_b);
sigma_y = sqrt( (9 * var_a) + (16 * var_b) );

ysum = zeros(numSims, 1); % preallocation
ydiff = zeros(numSims, 1);

for i = 1:numSims
    a = sigma_a * randn(numMeas, 1);
    b = sigma_b * randn(numMeas, 1);
    
    ysum(i) = ( 3 * a ) + ( 4 * b );

    ydiff(i) = ( 3 * a ) - ( 4 * b );
end

mean_ysum = mean(ysum);
mean_ydiff = mean(ydiff);

sigma_ysum = std(ysum);
sigma_ydiff = std(ydiff);

clearvars

% Part B
numSims = 100000;

dt = 0.1;
t_end = (1/dt) * 600; % end time (s)
time = 0:dt:t_end;
Ts = length(time);

sigma1 = 0.1;
sigma2 = 0.01;

wn1 = 0;
wn2 = 0;

int_wn1 = zeros(Ts, 1); % preallocation
int_wn2 = zeros(Ts, 1);

m_int_wn1 = zeros(numSims, 1);
m_int_wn2 = zeros(numSims, 1);

std_int_wn1 = zeros(numSims, 1);
std_int_wn2 = zeros(numSims, 1);

for i = 1:numSims % TODO: FIX THIS NOISE INTEGRATION
    
    noise1 = sigma1 * wgn(Ts,1,0); % unit/s
    noise2 = sigma2 * wgn(Ts,1,0); % unit/s
    
    for j = 1:Ts
        wn1 = wn1 + ( noise1(j) * dt );
        wn2 = wn2 + ( noise2(j) * dt );
        
        int_wn1(j) = wn1;
        int_wn2(j) = wn2;
    end
    
    m_int_wn1(i) = mean(int_wn1);
    m_int_wn2(i) = mean(int_wn2);
    
    std_int_wn1(i) = std(int_wn1);
    std_int_wn2(i) = std(int_wn2);
    
    wn1 = 0;
    wn2 = 0;
end

sigma_act_wn1 = sigma1 .* dt .* sqrt(time);
sigma_act_wn2 = sigma2 .* dt .* sqrt(time);

figure
plot(time, sigma_act_wn1)
hold on

% Part C

