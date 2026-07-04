                              %% Case 05 or 06
%num5 = 1;
%den5 = [m b k];
%G5 = tf(num5,den5);

num5 = 1;
t = 0:0.01:25; 

num5 = 1;
t = 0:0.01:25; 

%% --- FIGURE 1: Changing One Parameter at a Time ---
figure(1)

% Base Case Step [1 1 1]
G5_1 = tf(num5, [1 1 1]);
subplot(2,2,1); step(G5_1, t); title('Step: Base Case [1 1 1]'); grid on;
disp('Base Case Poles')
p1 = pole(G5_1)

% Increased Mass Step [2 1 1]
G5_2 = tf(num5, [2 1 1]);
subplot(2,2,2); step(G5_2, t); title('Step: Increased Mass [2 1 1]'); grid on;
disp('Increased Mass  Poles')
p2 = pole(G5_2)

% Increased Spring Step [1 1 2]
G5_3 = tf(num5, [1 1 2]);
subplot(2,2,3); step(G5_3, t); title('Step: Increased Spring [1 1 2]'); grid on;
disp('Increased Spring Poles')
p3 = pole(G5_3)

% Increased Friction Step [1 2 1]
G5_4 = tf(num5, [1 2 1]);
subplot(2,2,4); step(G5_4, t); title('Step: Increased Friction [1 2 1]'); grid on;
disp('Increased Friction Poles')
p4 = pole(G5_4)

sgtitle('Step Response of Effect of Changing Single Parameters')

figure(2)
% Base Case Impulse
subplot(2,2,1); impulse(G5_1, t); title('Impulse: Base Case'); grid on;

% Increased Mass Impulse
subplot(2,2,2); impulse(G5_2, t); title('Impulse: Increased Mass'); grid on;

% Increased Spring Impulse
subplot(2,2,3); impulse(G5_3, t); title('Impulse: Increased Spring'); grid on;

% Increased Friction Impulse
subplot(2,2,4); impulse(G5_4, t); title('Impulse: Increased Friction'); grid on;

sgtitle('Impulse Response of Effect of Changing Single Parameters')

info_B = stepinfo(G5_1);
fprintf('\n--- Base Case [1 1 1] Properties ---\n');
fprintf('Rise Time: %.2f seconds\n', info_B.RiseTime);
fprintf('Peak Time: %.2f seconds\n', info_B.PeakTime);
fprintf('Settling Time: %.2f seconds\n', info_B.SettlingTime);
fprintf('Overshoot: %.2f%%\n', info_B.Overshoot);

info_M = stepinfo(G5_2);
fprintf('\n--- Increased Mass Case [2 1 1] Properties ---\n');
fprintf('Rise Time: %.2f seconds\n', info_M.RiseTime);
fprintf('Peak Time: %.2f seconds\n', info_M.PeakTime);
fprintf('Settling Time: %.2f seconds\n', info_M.SettlingTime);
fprintf('Overshoot: %.2f%%\n', info_M.Overshoot);

info_S = stepinfo(G5_3);
fprintf('\n--- Increased Spring Case [1 1 2] Properties ---\n');
fprintf('Rise Time: %.2f seconds\n', info_S.RiseTime);
fprintf('Peak Time: %.2f seconds\n', info_S.PeakTime);
fprintf('Settling Time: %.2f seconds\n', info_S.SettlingTime);
fprintf('Overshoot: %.2f%%\n', info_S.Overshoot);

info_F = stepinfo(G5_4);
fprintf('\n--- Increased Friction Case [1 2 1] Properties ---\n');
fprintf('Rise Time: %.2f seconds\n', info_F.RiseTime);
fprintf('Peak Time: %.2f seconds\n', info_F.PeakTime);
fprintf('Settling Time: %.2f seconds\n', info_F.SettlingTime);
fprintf('Overshoot: %.2f%%\n', info_F.Overshoot);

%% --- FIGURE 2: When Damping Dominates vs. Spring Dominates ---
figure('Name', 'System Inequality Comparisons');

% t5: k > b > m [2 3 4] -> Highly oscillatory (Underdamped)
G5_5 = tf(num5, [2 3 4]);
disp('Underdamped Poles')
p5 = pole(G5_5)
subplot(2,1,1); step(G5_5, t); grid on;
title('Spring Dominates (k > b > m): Expect Oscillations');

% t6: b > k > m [2 4 3] -> Sluggish, slow rise (Overdamped)
G5_6 = tf(num5, [2 4 3]);
disp('Overdamped Poles')
p6 = pole(G5_6)
subplot(2,1,2); step(G5_6, t); grid on;
title('Damper Dominates (b > k > m): Expect Sluggish, No Bounce');


info_U = stepinfo(G5_5);
fprintf('\n--- Underdamped Case [2 3 4] Properties ---\n');
fprintf('Rise Time: %.2f seconds\n', info_U.RiseTime);
fprintf('PeakTime: %.2f seconds\n', info_U.PeakTime);
fprintf('Settling Time: %.2f seconds\n', info_U.SettlingTime);
fprintf('Overshoot: %.2f%%\n', info_U.Overshoot);

info_O = stepinfo(G5_6);
fprintf('\n--- Overdamped Case [2 4 3] Properties ---\n');
fprintf('Rise Time: %.2f seconds\n', info_O.RiseTime);
fprintf('Peak Time: %.2f seconds\n', info_O.PeakTime);
fprintf('Settling Time: %.2f seconds\n', info_O.SettlingTime);
fprintf('Overshoot: %.2f%%\n', info_O.Overshoot);
