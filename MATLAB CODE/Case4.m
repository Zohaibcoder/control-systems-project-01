%%                             Case 04
%                       G(s) = 1 / (ms^2 + 2bs)


% num4 = 1;
% den4 = [m 2*b 0];
% G4 = tf(num4,den4);

num4 = 1;

% -------------------- t1 --------------------
% m = 1 , 2b = 2
den4_1 = [1 2 0];

% ---------------- Combined Effect ----------------

% t2 : Increase Mass and Damping
% den4_2 = [3 4 0];

% t3 : Increase Damping and Mass
den4_2 = [2 6 0];

% --------------- Single Parameter Effect ---------------

% tmo : Only Damping Changes (m constant)
den4_3 = [1 6 0];

% tbo : Only Mass Changes (b constant)
% den4_3 = [3 2 0];

% Transfer Functions

G4_1 = tf(num4,den4_1);
disp('t1 Poles')
p1 = pole(G4_1)

G4_2 = tf(num4,den4_2);
disp('t3 Poles')
p3 = pole(G4_2)

G4_3 = tf(num4,den4_3);
disp('tmo Poles')
pmo = pole(G4_3)

