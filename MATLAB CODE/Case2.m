%%                              Case 02
%                           G(s) = 1 / (ms^2 + bs)

% num2 = 1;
% den2 = [m b 0];
% G2 = tf(num2,den2);

num2 = 1;

% -------------------- t1 --------------------
% m = 1 , b = 1
den2_1 = [1 1 0];

% ---------------- Combined Effect ----------------

% t2 : Increase Mass and Damping
% den2_2 = [3 2 0];

% t3 : Increase Damping and Mass
den2_2 = [2 3 0];

% --------------- Single Parameter Effect ---------------

% tmo : Only Damping Changes (m constant)
den2_3 = [1 3 0];

% tbo : Only Mass Changes (b constant)
% den2_3 = [3 1 0];

% Transfer Functions

G2_1 = tf(num2,den2_1);
disp('t1 Poles')
p1 = pole(G2_1)

G2_2 = tf(num2,den2_2);
disp('t3 Poles')
p3 = pole(G2_2)

G2_3 = tf(num2,den2_3);
disp('tmo Poles')
pmo = pole(G2_3)

% Time

t = 0:0.01:30;

% Responses
% 
[y1s,t1s] = step(G2_1,t);
[y2s,t2s] = step(G2_2,t);
[y3s,t3s] = step(G2_3,t);

% [y1i,t1i] = impulse(G2_1,t);
% [y2i,t2i] = impulse(G2_2,t);
% [y3i,t3i] = impulse(G2_3,t);

% Plot

figure(2)

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

legend('tmo','Location','best')
% legend('tbo','Location','best')

grid on

sgtitle('Case 02 : G(s) = 1 / (ms^2 + bs)')
 