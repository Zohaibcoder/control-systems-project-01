%%                               Case 01
%                           G(s) = 1 / (ms^2 + k)


% num1 = 1;
% den1 = [m 0 k];
% G1 = tf(num1,den1);

num1 = 1;

% -------------------- t1 --------------------
% m = 1 , k = 1
den1_1 = [1 0 1];

% ---------------- Combined Effect ----------------

% t2 : Increase Mass and Spring Constant
% den1_2 = [3 0 2];

% t3 : Increase Spring Constant and Mass
den1_2 = [2 0 3];

% --------------- Single Parameter Effect ---------------

% tmo : Only Spring Constant Changes (m constant)
den1_3 = [1 0 3];

% tko : Only Mass Changes (k constant)
% den1_3 = [3 0 1];

% Transfer Functions

G1_1 = tf(num1,den1_1);
disp('t1 Poles')
p1 = pole(G1_1)

G1_2 = tf(num1,den1_2);
disp('t3 Poles')
p3 = pole(G1_2)

G1_3 = tf(num1,den1_3);
disp('tmo Poles')
pmo = pole(G1_3)

% Time

t = 0:0.01:30;

% Responses

[y1s,t1s] = step(G1_1,t);
[y2s,t2s] = step(G1_2,t);
[y3s,t3s] = step(G1_3,t);

% [y1i,t1i] = impulse(G1_1,t);
% [y2i,t2i] = impulse(G1_2,t);
% [y3i,t3i] = impulse(G1_3,t);

% Plot

figure(1)

subplot(3,1,1)

plot(t1s,y1s,'r','LineWidth',2)
% plot(t1i,y1i,'r','LineWidth',2)

title('t1')
xlabel('Time (s)')
ylabel('Amplitude')
legend('t1','Location','best')
grid on

subplot(3,1,2)

plot(t2s,y2s,'b--','LineWidth',2)
% plot(t2i,y2i,'b--','LineWidth',2)

title('Combined Effect')
xlabel('Time (s)')
ylabel('Amplitude')

% legend('t2','Location','best')
legend('t3','Location','best')

grid on

subplot(3,1,3)

plot(t3s,y3s,'k:','LineWidth',2)
% plot(t3i,y3i,'k:','LineWidth',2)

title('Single Parameter Effect')
xlabel('Time (s)')
ylabel('Amplitude')

% legend('tko','Location','best')
legend('tmo','Location','best')

grid on

sgtitle('Case 01 : G(s) = 1 / (ms^2 + k)')
