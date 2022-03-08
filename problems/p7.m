%% Fundamentals of GPS - HW 3 - Problem 7

clear
clc

%% Part A

codeL = 1023;

CA4 = genCA(4, codeL);
CA7 = genCA(7, codeL);

idx4 = find(CA4 == 0);
idx7 = find(CA7 == 0);

CA4(idx4) = -1;
CA7(idx7) = -1;

figure
histogram(CA4)
title('PRN 4 C/A Histogram')

figure
histogram(CA7)
title('PRN 7 C/A Histogram')

%% Part B

figure
periodogram(CA4)
title('PRN 4 C/A PSD Estimate')

figure
periodogram(CA7)
title('PRN 7 C/A PSD Estimate')

%% Part C

figure
autocorr(CA4, 'NumLags', codeL-1)
title('PRN 4 C/A Autocorrelation')
xlim([0 codeL-1])

figure
autocorr(CA7, 'NumLags', codeL-1)
title('PRN 7 C/A Autocorrelation')
xlim([0 codeL-1])

%% Part D

figure
crosscorr(CA4, CA7, 'NumLags', codeL-1)
title('PRN 4 & 7 C/A Cross Correlation')
xlim([-codeL codeL])