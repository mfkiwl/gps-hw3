%% Fundamentals of GPS - HW 3 - Problem 2

clear
clc

%% Solution

% Pseudorange Accuracy
sigma = 0.5;

% GPS L-Band Frequencies (MHz)
L1 = 1575.42;
L2 = 1227.60;
L5 = 1176.45;

L1L5(1) = ( L1^2 / (L1^2 - L5^2) );
L1L5(2) = ( L5^2 / (L1^2 - L5^2) );
L2L5(1) = ( L2^2 / (L2^2 - L5^2) );
L2L5(2) = ( L5^2 / (L2^2 - L5^2) );

sigma_L1L5 = sqrt(L1L5(1) * sigma^2 + L1L5(2) * sigma^2);
sigma_L2L5 = sqrt(L2L5(1) * sigma^2 + L2L5(2) * sigma^2);

% L!-L5 provides the best estimate.