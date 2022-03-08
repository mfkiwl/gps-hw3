%% Fundamentals of GPS - HW 3 - Problem 6

clear
clc

%% Part A

codeL = 1023;

CA4 = genCA(4, codeL);
CA7 = genCA(7, codeL);

chips = 16;

first = 1:chips;
last = codeL-(chips-1):codeL;

figure
subplot(2,1,1)
stairs(first, CA4(first), 'LineWidth', 2)
xlim([first(1) first(end)])
ylim([0 1.5])
title('PRN 4 C/A Code: First 16 Chips')
ylabel('Bit Value')

subplot(2,1,2)
stairs(last, CA4(last), 'LineWidth', 2)
xlim([last(1) last(end)])
ylim([0 1.5])
title('PRN 4 C/A Code: Last 16 Chips')
xlabel('Chips')
ylabel('Bit Value')

figure
subplot(2,1,1)
stairs(first, CA7(first), 'LineWidth', 2)
xlim([first(1) first(end)])
ylim([0 1.5])
title('PRN 7 C/A Code: First 16 Chips')
ylabel('Bit Value')

subplot(2,1,2)
stairs(last, CA7(last), 'LineWidth', 2)
xlim([last(1) last(end)])
ylim([0 1.5])
title('PRN 7 C/A Code: Last 16 Chips')
xlabel('Chips')
ylabel('Bit Value')

clearvars

%% Part B

codeL = 2046;

CA4 = genCA(4, codeL);
CA7 = genCA(7, codeL);

chips = 16;

first = 1024:1040;
last = codeL-(chips-1):codeL;

figure
subplot(2,1,1)
stairs(first, CA4(first), 'LineWidth', 2)
xlim([first(1) first(end)])
ylim([0 1.5])
title('PRN 4 C/A Code: 1024-1040 Chips')
ylabel('Bit Value')

subplot(2,1,2)
stairs(last, CA4(last), 'LineWidth', 2)
xlim([last(1) last(end)])
ylim([0 1.5])
title('PRN 4 C/A Code: Last 16 Chips')
xlabel('Chips')
ylabel('Bit Value')

figure
subplot(2,1,1)
stairs(first, CA7(first), 'LineWidth', 2)
xlim([first(1) first(end)])
ylim([0 1.5])
title('PRN 7 C/A Code: First 16 Chips')
ylabel('Bit Value')

subplot(2,1,2)
stairs(last, CA7(last), 'LineWidth', 2)
xlim([last(1) last(end)])
ylim([0 1.5])
title('PRN 7 C/A Code: Last 16 Chips')
xlabel('Chips')
ylabel('Bit Value')

clearvars